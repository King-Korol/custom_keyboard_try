import 'dart:developer';

import 'package:custom_keyboard_try/keyboard_widget/custom_keyboard.dart';
import 'package:custom_keyboard_try/keyboard_widget/keyboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Keyboard extends ConsumerStatefulWidget {
  const Keyboard({
    Key? key,
    required this.offset,
    required this.parentSize,
    required this.height,
    required this.keyboardType,
    required this.insertText,
    required this.backspace,
    this.ok,
  }) : super(key: key);

  final Size parentSize;
  final double height;
  final Offset offset;
  final int keyboardType;

  final Function(String) insertText;
  final Function() backspace;
  final VoidCallback? ok;

  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends ConsumerState<Keyboard> {
  double _height = 0.0;
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ref.watch(keyboardProvider.notifier).changeHeightPadding(
            (widget.offset.dy + widget.parentSize.height),
            widget.height,
            widget.keyboardType,
          );
      ref.watch(keyboardProvider.notifier).changeShowCursor(true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    _height = height * (widget.keyboardType == 0 ? 0.33 : 0.22);

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          // log('''Keyboard: widget.offset.dy: ${widget.offset.dy},
          //  constraints.maxHeight: ${constraints.maxHeight}''');
          // log('bottom: $bottom,_height: $_height, sizToTextField: ${_height + widget.parentSize.height}');
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  log('Unfocus/dismiss  dialog');
                  ref.watch(keyboardProvider.notifier).changeShowCursor(false);
                  Navigator.maybeOf(context, rootNavigator: true)?.maybePop();
                },
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: width,
                  height: _height,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 1,
                          spreadRadius: 2,
                          offset: const Offset(0, 2))
                    ],
                  ),
                  child: CustomKeyboard(
                      keyboardType: widget.keyboardType,
                      onTextInput: (myText) {
                        log('onTextInput: $myText');
                        widget.insertText.call(myText);
                      },
                      onBackspace: () {
                        log('onBackspace');
                        widget.backspace.call();
                      },
                      ok: () {
                        ref
                            .watch(keyboardProvider.notifier)
                            .changeShowCursor(false);
                        Navigator.maybeOf(context, rootNavigator: true)
                            ?.maybePop();

                        widget.ok?.call();
                      }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
