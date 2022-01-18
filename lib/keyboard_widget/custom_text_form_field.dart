import 'dart:developer';

import 'package:custom_keyboard_try/keyboard_widget/keyboard.dart';
import 'package:custom_keyboard_try/keyboard_widget/keyboard_provider.dart';
import 'package:custom_keyboard_try/keyboard_widget/keyboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChange;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.validator,
    this.labelText,
    this.onChange,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = FocusNode();
    super.initState();
  }

  void insertText(String myText) {
    final text = widget.controller.text;
    final textSelection = widget.controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    widget.controller.text = newText;
    widget.controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
    widget.onChange?.call(newText);
  }

  void _backspace() {
    final text = widget.controller.text;
    final textSelection = widget.controller.selection;
    final selectionLength = textSelection.end - textSelection.start;
    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      widget.controller.text = newText;
      widget.controller.selection = textSelection.copyWith(
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
    widget.controller.text = newText;
    widget.controller.selection = textSelection.copyWith(
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Consumer(
      builder: (context, ref, child) {
        final showCursor = ref.watch(keyboardProvider).showCursor;
        ref.listen<KeyboardState>(keyboardProvider, (states, state) {
          if (state.showCursor) {
            _focusNode.requestFocus();
          } else {
            _focusNode.unfocus();
          }
        });
        return SizedBox(
          width: width * 0.5,
          child: TextFormField(
            controller: widget.controller,
            validator: (value) {
              log('validator in dropDown ${widget.validator?.call(value)}');
              return widget.validator?.call(value);
            },
            onTap: () {
              final RenderBox buttonBox =
                  context.findRenderObject()! as RenderBox;

              final NavigatorState navigator = Navigator.of(context);
              final Offset buttonOffset = buttonBox.localToGlobal(
                Offset.zero,
                ancestor: navigator.context.findRenderObject(),
              );
              log('buttonBox.size: ${buttonBox.size}}');
              log('buttonOffset: $buttonOffset');

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
                    backspace: _backspace,
                    insertText: (text) {
                      insertText(text);
                    },
                  );
                },
              );
            },
            onChanged: (value) {
              log('value: $value');
            },
            enabled: true,
            style: Theme.of(context).textTheme.bodyText1,
            decoration: InputDecoration(
              labelText: widget.labelText,
              suffixIcon: IconButton(
                icon: Icon(Icons.keyboard_arrow_down_outlined,
                    size: 26.0, color: Theme.of(context).colorScheme.primary),
                onPressed: () {},
              ),
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
            showCursor: showCursor,
            focusNode: _focusNode,
          ),
        );
      },
    );
  }
}
