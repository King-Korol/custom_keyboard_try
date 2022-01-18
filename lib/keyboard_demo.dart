import 'dart:developer';

import 'package:custom_keyboard_try/keyboard_widget/custom_text_form_field.dart';
import 'package:custom_keyboard_try/keyboard_widget/keyboard_provider.dart';
import 'package:custom_keyboard_try/keyboard_widget/keyboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeyboardDemo extends StatefulWidget {
  const KeyboardDemo({Key? key}) : super(key: key);

  @override
  _KeyboardDemoState createState() => _KeyboardDemoState();
}

class _KeyboardDemoState extends State<KeyboardDemo> {
  late TextEditingController _controller;
  final ScrollController scrollController = ScrollController();
  bool sizeBottomPadding = false;

  @override
  void initState() {
    _controller = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    log('KeyboardDemo build');
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: Consumer(builder: (context, ref, child) {
        ref.listen<KeyboardState>(keyboardProvider, (states, state) {
          if (state.showCursor) {
            setState(() {
              sizeBottomPadding = true;
            });
            scrollController.animateTo(
              state.heightPadding,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          } else {
            setState(() {
              sizeBottomPadding = false;
            });
            scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          }
        });
        return SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 170,
                    width: width,
                    color: Colors.red[600],
                  ),
                  CustomTextFormField(
                    controller: _controller,
                    onChange: (text) {
                      log('text: $text');
                    },
                  ),
                  Container(
                    height: 100,
                    color: Colors.orange[400],
                  ),
                  CustomTextFormField(
                    controller: _controller,
                    onChange: (text) {
                      log('text: $text');
                    },
                  ),
                  Container(
                    height: 100,
                    color: Colors.red[400],
                  ),
                  CustomTextFormField(
                    controller: _controller,
                    onChange: (text) {
                      log('text: $text');
                    },
                  ),
                  Container(
                    height: 100,
                    color: Colors.black12,
                  ),
                  CustomTextFormField(
                    controller: _controller,
                    onChange: (text) {
                      log('text: $text');
                    },
                  ),
                  Container(
                    height: 100,
                    color: Colors.pink[400],
                  ),
                  CustomTextFormField(
                    controller: _controller,
                    onChange: (text) {
                      log('text: $text');
                    },
                  ),
                  Container(
                    height: 100,
                    color: Colors.amber[400],
                  ),
                  CustomTextFormField(
                    controller: _controller,
                    onChange: (text) {
                      log('text: $text');
                    },
                  ),
                  Container(
                    height: 100,
                    color: Colors.lightGreen[400],
                  ),
                  CustomTextFormField(
                    controller: _controller,
                    onChange: (text) {
                      log('text: $text');
                    },
                  ),
                  Container(
                    height: sizeBottomPadding ? height * 0.33 : 0,
                    color: Colors.orange[500],
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
