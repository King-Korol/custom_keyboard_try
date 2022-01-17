import 'package:flutter/material.dart';

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({
    Key? key,
    this.onTextInput,
    this.onBackspace,
  }) : super(key: key);

  final ValueSetter<String>? onTextInput;
  final VoidCallback? onBackspace;

  @override
  State<CustomKeyboard> createState() => _CustomKeyboardState();
}

class _CustomKeyboardState extends State<CustomKeyboard> {
  void _textInputHandler(String text) => widget.onTextInput?.call(text);

  void _backspaceHandler() => widget.onBackspace?.call();
  late bool lettersBig = false;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.33,
      color: Colors.blue,
      child: Column(
        children: [
          buildRowOne(lettersBig),
          buildRowTwo(),
          buildRowThree(),
          buildRowFour(),
        ],
      ),
    );
  }

  Expanded buildRowOne(bool lettersBig) {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: lettersBig ? 'Й' : 'й',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: lettersBig ? 'Ц' : 'ц',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: lettersBig ? 'У' : 'у',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: lettersBig ? 'К' : 'к',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: lettersBig ? 'Е' : 'е',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: lettersBig ? 'Н' : 'н',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: lettersBig ? 'Г' : 'г',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: lettersBig ? 'Ш' : 'ш',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: lettersBig ? 'Щ' : 'щ',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: lettersBig ? 'З' : 'з',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: lettersBig ? 'Х' : 'х',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: lettersBig ? 'Ї' : 'ї',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowTwo() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: 'a',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'b',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'c',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'd',
            onTextInput: _textInputHandler,
          ),
          TextKey(
            text: 'e',
            onTextInput: _textInputHandler,
          ),
        ],
      ),
    );
  }

  Expanded buildRowThree() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: ' ',
            flex: 4,
            onTextInput: _textInputHandler,
          ),
          BackspaceKey(
            onBackspace: () {
              setState(() {
                lettersBig = !lettersBig;
              });
            },
            icon: Icons.forward_sharp,
          ),
        ],
      ),
    );
  }

  Expanded buildRowFour() {
    return Expanded(
      child: Row(
        children: [
          TextKey(
            text: ' ',
            flex: 1,
            onTextInput: _textInputHandler,
          ),
          BackspaceKey(
            onBackspace: _backspaceHandler,
            icon: Icons.backspace,
          ),
        ],
      ),
    );
  }
}

class TextKey extends StatelessWidget {
  const TextKey({
    Key? key,
    @required this.text,
    this.onTextInput,
    this.flex = 1,
  }) : super(key: key);

  final String? text;
  final ValueSetter<String>? onTextInput;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: Material(
          color: Colors.blue.shade300,
          child: InkWell(
            onTap: () {
              onTextInput?.call(text ?? '');
            },
            child: Center(child: Text(text ?? '')),
          ),
        ),
      ),
    );
  }
}

class BackspaceKey extends StatelessWidget {
  const BackspaceKey({
    Key? key,
    this.onBackspace,
    this.flex = 1,
    required this.icon,
  }) : super(key: key);

  final VoidCallback? onBackspace;
  final int flex;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        child: Material(
          color: Colors.blue.shade300,
          child: InkWell(
            onTap: () {
              onBackspace?.call();
            },
            child: Center(
              child: Icon(icon),
            ),
          ),
        ),
      ),
    );
  }
}
