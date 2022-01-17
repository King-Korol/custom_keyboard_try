import 'dart:developer';

import 'package:custom_keyboard_try/drop_down_widget/custom_keyboard.dart';
import 'package:custom_keyboard_try/drop_down_widget/keyboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Keyboard extends ConsumerStatefulWidget {
  const Keyboard({
    required this.offset,
    required this.parentSize,
    Key? key,
    this.itemExtent,
    this.insertText,
    this.backspace,
  }) : super(key: key);

  final double? itemExtent;

  final Size parentSize;

  final Offset offset;

  final Function(String)? insertText;
  final Function()? backspace;

  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends ConsumerState<Keyboard> {
  double _height = 0.0;
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      ref.watch(keyboardProvider.notifier).changeShowCursor(true);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    _height = height * 0.33;

    final padding = MediaQuery.of(context).padding;
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bottom = constraints.maxHeight +
              padding.top -
              widget.offset.dy -
              widget.parentSize.height;
          log('''Keyboard: padding: $padding,
           widget.offset.dy: ${widget.offset.dy},
           widget.parentSize.height: ${widget.parentSize.height}
           widget.parentSize.width: ${widget.parentSize.width}
           constraints.maxHeight: ${constraints.maxHeight}''');
          log('bottom: $bottom,_height: $_height, sizToTextField: ${_height + widget.parentSize.height}');
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
                // top: top,
                bottom: 0,
                child: Container(
                  width: width,
                  height: _height,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 1,
                          spreadRadius: 2,
                          offset: const Offset(0, 2))
                    ],
                  ),
                  child: CustomKeyboard(
                    onTextInput: (myText) {
                      log('onTextInput myText: $myText');
                      widget.insertText?.call(myText);
                    },
                    onBackspace: () {
                      log('onBackspace');
                      widget.backspace?.call();
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
