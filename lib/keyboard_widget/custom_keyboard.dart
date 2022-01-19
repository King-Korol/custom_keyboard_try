import 'dart:developer';

import 'package:custom_keyboard_try/keyboard_widget/keyboard_provider.dart';
import 'package:custom_keyboard_try/keyboard_widget/keyboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({
    Key? key,
    required this.onTextInput,
    required this.onBackspace,
    required this.type,
    required this.ok,
  }) : super(key: key);

  final ValueSetter<String> onTextInput;
  final VoidCallback onBackspace;
  final VoidCallback? ok;
  final int type;

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  void _textInputHandler(String text) => widget.onTextInput.call(text);

  void _backspaceHandler() => widget.onBackspace.call();

  late bool lettersBig = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * (widget.type == 0 ? 0.33 : 0.22),
      padding: EdgeInsets.all(5),
      color: Colors.blue,
      child: Consumer(builder: (context, ref, child) {
        final locale = ref.watch(keyboardProvider).localeKeyboard;
        final keyboardType = ref.watch(keyboardProvider).keyboardType;
        return widget.type == 0
            ? Column(
                children: [
                  buildRowOne(locale, keyboardType),
                  buildRowTwo(locale, keyboardType),
                  buildRowThree(locale, keyboardType),
                  buildRowFour(locale, ref, keyboardType),
                ],
              )
            : Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        buildFirstNumberLine(),
                        buildSecondNumberLine(),
                      ],
                    ),
                  ),
                  TextKey(
                    text: 'OK',
                    onTextInput: (value) {
                      widget.ok?.call();
                    },
                    type: 2,
                  )
                ],
              );
      }),
    );
  }

  Expanded buildRowOne(String locale, int keyboardType) {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 1,
              index: 0,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 1,
              index: 1,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 1,
              index: 2,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 1,
              index: 3,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 1,
              index: 4,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 1,
              index: 5,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 1,
              index: 6,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 1,
              index: 7,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 1,
              index: 8,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 1,
              index: 9,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          if (locale != localeEn && keyboardType != numericType)
            TextKey(
              text: textKey(
                  isBig: lettersBig,
                  line: 1,
                  index: 10,
                  locale: locale,
                  keyboardType: keyboardType),
              onTextInput: _textInputHandler,
            ),
          if (locale == localeUk && keyboardType != numericType)
            TextKey(
              text: textKey(
                  isBig: lettersBig,
                  line: 1,
                  index: 11,
                  locale: locale,
                  keyboardType: keyboardType),
              onTextInput: _textInputHandler,
            ),
        ],
      ),
    );
  }

  Expanded buildRowTwo(String locale, int keyboardType) {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 2,
              index: 0,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 2,
              index: 1,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 2,
              index: 2,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 2,
              index: 3,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 2,
              index: 4,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 2,
              index: 5,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 2,
              index: 6,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 2,
              index: 7,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 2,
              index: 8,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          if (locale != localeEn || keyboardType == numericType)
            TextKey(
              text: textKey(
                isBig: lettersBig,
                line: 2,
                index: 9,
                locale: locale,
                keyboardType: keyboardType,
              ),
              onTextInput: _textInputHandler,
            ),
          if (locale != localeEn && keyboardType != numericType)
            TextKey(
              text: textKey(
                isBig: lettersBig,
                line: 2,
                index: 10,
                locale: locale,
                keyboardType: keyboardType,
              ),
              onTextInput: _textInputHandler,
            ),
          if (locale == localeUk && keyboardType != numericType)
            TextKey(
              text: textKey(
                isBig: lettersBig,
                line: 2,
                index: 11,
                locale: locale,
                keyboardType: keyboardType,
              ),
              onTextInput: _textInputHandler,
            ),
        ],
      ),
    );
  }

  Expanded buildRowThree(String locale, int keyboardType) {
    return Expanded(
      child: Row(
        children: [
          if (keyboardType == letterType)
            FunctionalKey(
              onPressed: () {
                setState(() {
                  lettersBig = !lettersBig;
                });
              },
              icon: Icons.forward_sharp,
            ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 3,
              index: 0,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 3,
              index: 1,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 3,
              index: 2,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 3,
              index: 3,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 3,
              index: 4,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 3,
              index: 5,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: textKey(
              isBig: lettersBig,
              line: 3,
              index: 6,
              locale: locale,
              keyboardType: keyboardType,
            ),
            onTextInput: _textInputHandler,
          ),
          if (locale != localeEn || keyboardType == numericType)
            TextKey(
              text: textKey(
                isBig: lettersBig,
                line: 3,
                index: 7,
                locale: locale,
                keyboardType: keyboardType,
              ),
              onTextInput: _textInputHandler,
            ),
          if (locale != localeEn || keyboardType == numericType)
            TextKey(
              text: textKey(
                isBig: lettersBig,
                line: 3,
                index: 8,
                locale: locale,
                keyboardType: keyboardType,
              ),
              onTextInput: _textInputHandler,
            ),
          if (locale == localeUk && keyboardType != numericType)
            TextKey(
              text: textKey(
                isBig: lettersBig,
                line: 3,
                index: 9,
                locale: locale,
                keyboardType: keyboardType,
              ),
              onTextInput: _textInputHandler,
            ),
          FunctionalKey(
            onPressed: _backspaceHandler,
            icon: Icons.backspace_outlined,
          ),
        ],
      ),
    );
  }

  Expanded buildRowFour(String locale, WidgetRef ref, int keyboardType) {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: keyboardType == numericType
                ? '123'
                : locale == localeEn
                    ? 'abc'
                    : 'абв',
            onTextInput: (text) {
              ref.watch(keyboardProvider.notifier).changeKeyboardType();
            },
          ),
          FunctionalKey(
            onPressed: () {
              ref.watch(keyboardProvider.notifier).changeLocaleKeyboard();
            },
            icon: Icons.language_outlined,
          ),
          TextKey(
            text: ',',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: ' ',
            flex: 6,
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: '.',
            onTextInput: _textInputHandler,
          ),
          FunctionalKey(
            onPressed: _backspaceHandler,
            flex: 2,
            icon: Icons.subdirectory_arrow_left_outlined,
          ),
        ],
      ),
    );
  }

  Expanded buildFirstNumberLine() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '1',
            onTextInput: _textInputHandler,
            type: 1,
          ),
          TextKey(
            text: '2',
            onTextInput: _textInputHandler,
            type: 1,
          ),
          TextKey(
            text: '3',
            onTextInput: _textInputHandler,
            type: 1,
          ),
          TextKey(
            text: '4',
            onTextInput: _textInputHandler,
            type: 1,
          ),
          TextKey(
            text: '5',
            onTextInput: _textInputHandler,
            type: 1,
          ),
          FunctionalKey(
            onPressed: _backspaceHandler,
            icon: Icons.backspace_outlined,
            type: 1,
          ),
        ],
      ),
    );
  }

  Expanded buildSecondNumberLine() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: '6',
            onTextInput: _textInputHandler,
            type: 1,
          ),
          TextKey(
            text: '7',
            onTextInput: _textInputHandler,
            type: 1,
          ),
          TextKey(
            text: '8',
            onTextInput: _textInputHandler,
            type: 1,
          ),
          TextKey(
            text: '9',
            onTextInput: _textInputHandler,
            type: 1,
          ),
          TextKey(
            text: '0',
            onTextInput: _textInputHandler,
            type: 1,
          ),
          TextKey(
            text: '.',
            onTextInput: _textInputHandler,
            type: 1,
          ),
        ],
      ),
    );
  }

  String textKey({
    required bool isBig,
    required int line,
    required int index,
    required String locale,
    required int keyboardType,
  }) {
    final ukFirstLineBig = [
      'Й',
      'Ц',
      'У',
      'К',
      'Е',
      'Н',
      'Г',
      'Ш',
      'Щ',
      'З',
      'Х',
      'Ї'
    ];
    final ukFirstLineSmall = [
      'й',
      'ц',
      'у',
      'к',
      'е',
      'н',
      'г',
      'ш',
      'щ',
      'з',
      'х',
      'ї'
    ];
    final ukSecondLineBig = [
      'Ф',
      'І',
      'В',
      'А',
      'П',
      'Р',
      'О',
      'Л',
      'Д',
      'Ж',
      'Є',
      '\''
    ];
    final ukSecondLineSmall = [
      'ф',
      'і',
      'в',
      'а',
      'п',
      'р',
      'о',
      'л',
      'д',
      'ж',
      'є',
      '\''
    ];
    final ukThirdLineBig = ['Я', 'Ч', 'С', 'М', 'И', 'Т', 'Ь', 'Б', 'Ю', 'Ґ'];
    final ukThirdLineSmall = ['я', 'ч', 'с', 'м', 'и', 'т', 'ь', 'б', 'ю', 'ґ'];

    final ruFirstLineBig = [
      'Й',
      'Ц',
      'У',
      'К',
      'Е',
      'Н',
      'Г',
      'Ш',
      'Щ',
      'З',
      'Х'
    ];
    final ruFirstLineSmall = [
      'й',
      'ц',
      'у',
      'к',
      'е',
      'н',
      'г',
      'ш',
      'щ',
      'з',
      'х'
    ];
    final ruSecondLineBig = [
      'Ф',
      'Ы',
      'В',
      'А',
      'П',
      'Р',
      'О',
      'Л',
      'Д',
      'Ж',
      'Э'
    ];
    final ruSecondLineSmall = [
      'ф',
      'ы',
      'в',
      'а',
      'п',
      'р',
      'о',
      'л',
      'д',
      'ж',
      'э'
    ];
    final ruThirdLineBig = ['Я', 'Ч', 'С', 'М', 'И', 'Т', 'Ь', 'Б', 'Ю'];
    final ruThirdLineSmall = ['я', 'ч', 'с', 'м', 'и', 'т', 'ь', 'б', 'ю'];

    final enFirstLineBig = ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'];
    final enFirstLineSmall = ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'];
    final enSecondLineBig = ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'];
    final enSecondLineSmall = ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'];
    final enThirdLineBig = ['Z', 'X', 'C', 'V', 'B', 'N', 'M'];
    final enThirdLineSmall = ['z', 'x', 'c', 'v', 'b', 'n', 'm'];

    final firstLineNumeric = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0'];
    final secondLineNumeric = [
      '@',
      '#',
      '№',
      '₴',
      '_',
      '-',
      '(',
      ')',
      '=',
      '%'
    ];
    final thirdLineNumeric = ['\$', '"', '\'', '*', ':', '/', '!', '?', '+'];
    if (line == 1) {
      if (keyboardType == numericType) {
        return firstLineNumeric[index];
      } else {
        if (locale == 'uk') {
          if (isBig) {
            return ukFirstLineBig[index];
          } else {
            return ukFirstLineSmall[index];
          }
        } else if (locale == 'ru') {
          if (isBig) {
            return ruFirstLineBig[index];
          } else {
            return ruFirstLineSmall[index];
          }
        } else {
          if (isBig) {
            return enFirstLineBig[index];
          } else {
            return enFirstLineSmall[index];
          }
        }
      }
    } else if (line == 2) {
      if (keyboardType == numericType) {
        return secondLineNumeric[index];
      } else {
        if (locale == 'uk') {
          if (isBig) {
            return ukSecondLineBig[index];
          } else {
            return ukSecondLineSmall[index];
          }
        } else if (locale == 'ru') {
          if (isBig) {
            return ruSecondLineBig[index];
          } else {
            return ruSecondLineSmall[index];
          }
        } else {
          if (isBig) {
            return enSecondLineBig[index];
          } else {
            return enSecondLineSmall[index];
          }
        }
      }
    } else {
      if (keyboardType == numericType) {
        return thirdLineNumeric[index];
      } else {
        if (locale == 'uk') {
          if (isBig) {
            return ukThirdLineBig[index];
          } else {
            return ukThirdLineSmall[index];
          }
        } else if (locale == 'ru') {
          if (isBig) {
            return ruThirdLineBig[index];
          } else {
            return ruThirdLineSmall[index];
          }
        } else {
          if (isBig) {
            return enThirdLineBig[index];
          } else {
            return enThirdLineSmall[index];
          }
        }
      }
    }
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    Key? key,
    @required this.text,
    this.onTextInput,
    this.flex = 1,
    this.type = 0,
  }) : super(key: key);

  final String? text;
  final ValueSetter<String>? onTextInput;
  final int flex;
  final int? type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.all(type == 0
            ? 6.0
            : type == 1
                ? 15
                : 27),
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(8)),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            onTextInput?.call(text ?? '');
          },
          child: Center(
              child: Text(
            text ?? '',
            style: Theme.of(context).textTheme.headline4,
          )),
        ),
      ),
    );
  }
}

class FunctionalKey extends StatelessWidget {
  const FunctionalKey({
    Key? key,
    this.onPressed,
    this.flex = 1,
    required this.icon,
    this.type = 0,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final int flex;
  final IconData icon;
  final int? type;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.all(type == 0
            ? 6.0
            : type == 1
                ? 15
                : 27),
        color: Colors.blue.shade300,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            onPressed?.call();
          },
          child: Center(
            child: Icon(
              icon,
              size: 46,
            ),
          ),
        ),
      ),
    );
  }
}
