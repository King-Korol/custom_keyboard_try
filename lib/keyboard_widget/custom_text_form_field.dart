import 'dart:developer';

import 'package:custom_keyboard_try/keyboard_widget/keyboard.dart';
import 'package:custom_keyboard_try/keyboard_widget/keyboard_provider.dart';
import 'package:custom_keyboard_try/keyboard_widget/keyboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const typeText = 0;
const typeNumber = 1;

class CustomTextFormField extends StatefulWidget {
  final int keyboardType;
  final double width;
  final int number;
  final bool showCursor;
  final TextStyle? style;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;
  final String? labelText;
  final TextStyle? labelStyle;
  final VoidCallback? ok;
  final Widget? sufixIcon;
  final Widget? prefixIcon;
  final int? maxLines;

  const CustomTextFormField({
    Key? key,
    required this.keyboardType,
    required this.width,
    required this.number,
    required this.showCursor,
    this.style,
    this.validator,
    this.onChange,
    this.labelText,
    this.labelStyle,
    this.ok,
    this.sufixIcon,
    this.prefixIcon,
    this.maxLines,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;
  late TextEditingController textController;

  @override
  void initState() {
    _focusNode = FocusNode();
    textController = TextEditingController(text: '');
    super.initState();
  }

  void insertText(String myText) {
    final text = textController.text;
    final textSelection = textController.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    textController.text = newText;
    textController.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
    widget.onChange?.call(newText);
  }

  void _backspace() {
    final text = textController.text;
    final textSelection = textController.selection;
    final selectionLength = textSelection.end - textSelection.start;
    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      textController.text = newText;
      textController.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }
    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }
    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    textController.text = newText;
    textController.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
    widget.onChange?.call(newText);
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Consumer(
      builder: (context, ref, child) {
        final number = ref.watch(keyboardProvider).number;
        ref.listen<KeyboardState>(keyboardProvider, (states, state) {
          if (state.showCursor) {
            _focusNode.requestFocus();
          } else {
            _focusNode.unfocus();
          }
        });
        return SizedBox(
          width: widget.width,
          child: TextFormField(
            controller: textController,
            validator: (value) {
              log('validator in customTextFormField ${widget.validator?.call(value)}');
              return widget.validator?.call(value);
            },
            onTap: () {
              ref.watch(keyboardProvider.notifier).changeNumber(widget.number);
              final RenderBox buttonBox =
                  context.findRenderObject()! as RenderBox;

              final NavigatorState navigator = Navigator.of(context);
              final Offset buttonOffset = buttonBox.localToGlobal(
                Offset.zero,
                ancestor: navigator.context.findRenderObject(),
              );
              log('buttonBox.size: ${buttonBox.size}}');
              log('buttonOffset: $buttonOffset');
              log('widget.number: ${widget.number}');

              showDialog(
                barrierColor: Colors.transparent,
                useSafeArea: false,
                context: context,
                useRootNavigator: false,
                builder: (context) {
                  return Keyboard(
                    offset: buttonOffset,
                    parentSize: buttonBox.size,
                    height: height,
                    keyboardType: widget.keyboardType,
                    backspace: _backspace,
                    ok: widget.ok,
                    insertText: (text) {
                      insertText(text);
                    },
                  );
                },
              );
            },
            enabled: true,
            style: widget.style ?? Theme.of(context).textTheme.bodyText1,
            maxLines: widget.maxLines ?? 1,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: widget.labelStyle,
              suffixIcon: widget.sufixIcon,
              prefixIcon: widget.prefixIcon,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            readOnly: true,
            showCursor: widget.showCursor,
            focusNode: number == widget.number ? _focusNode : null,
          ),
        );
      },
    );
  }
}
