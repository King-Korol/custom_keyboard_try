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
  late TextEditingController textController1;
  late TextEditingController textController2;
  late TextEditingController textController3;
  late TextEditingController textController4;
  late TextEditingController textController5;
  late TextEditingController textController6;
  late TextEditingController textController7;
  final ScrollController scrollController = ScrollController();
  bool sizeBottomPadding = false;

  @override
  void initState() {
    textController1 = TextEditingController(text: '');
    textController2 = TextEditingController(text: '');
    textController3 = TextEditingController(text: '');
    textController4 = TextEditingController(text: '');
    textController5 = TextEditingController(text: '');
    textController6 = TextEditingController(text: '');
    textController7 = TextEditingController(text: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    log('KeyboardDemo build');
    return Scaffold(
      body: Consumer(builder: (context, ref, child) {
        final showCursor = ref.watch(keyboardProvider).showCursor;
        final number = ref.watch(keyboardProvider).number;
        ref.listen<KeyboardState>(keyboardProvider, (states, state) {
          if (state.showCursor) {
            if (sizeBottomPadding == false) {
              scrollController.animateTo(
                scrollController.position.pixels + state.heightPadding,
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeIn,
              );
            }
            setState(() {
              sizeBottomPadding = true;
            });
          } else {
            setState(() {
              sizeBottomPadding = false;
            });
            scrollController.animateTo(
              scrollController.position.pixels,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeIn,
            );
          }
        });
        return Column(
          children: [
            SizedBox(
              height: height * 0.3,
            ),
            SizedBox(
              height: height * 0.7,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 170,
                      width: width,
                      color: Colors.red[600],
                    ),
                    CustomTextFormField(
                      controller: textController1,
                      keyboardType: typeNumber,
                      width: width * 0.5,
                      number: 0,
                      showCursor: number == 0 ? showCursor : false,
                      maxLines: 1,
                      onChange: (text) {
                        log('text1: $text');
                      },
                      ok: () {
                        log('Ok tap');
                      },
                    ),
                    Container(
                      height: 100,
                      color: Colors.orange[400],
                    ),
                    CustomTextFormField(
                      controller: textController2,
                      keyboardType: typeText,
                      width: width * 0.5,
                      number: 1,
                      showCursor: number == 1 ? showCursor : false,
                      maxLines: 2,
                      onChange: (text) {
                        log('text2: $text');
                      },
                    ),
                    Container(
                      height: 100,
                      color: Colors.red[400],
                    ),
                    CustomTextFormField(
                      controller: textController3,
                      keyboardType: typeNumber,
                      width: width * 0.4,
                      number: 2,
                      showCursor: number == 2 ? showCursor : false,
                      maxLines: 3,
                      onChange: (text) {
                        log('text3: $text');
                      },
                    ),
                    Container(
                      height: 100,
                      color: Colors.black12,
                    ),
                    CustomTextFormField(
                      controller: textController4,
                      keyboardType: typeNumber,
                      width: width * 0.6,
                      number: 3,
                      showCursor: number == 3 ? showCursor : false,
                      onChange: (text) {
                        log('text4: $text');
                      },
                    ),
                    Container(
                      height: 100,
                      color: Colors.pink[400],
                    ),
                    CustomTextFormField(
                      controller: textController5,
                      keyboardType: typeText,
                      width: width * 0.5,
                      number: 4,
                      showCursor: number == 4 ? showCursor : false,
                      onChange: (text) {
                        log('text5: $text');
                      },
                    ),
                    Container(
                      height: 100,
                      color: Colors.amber[400],
                    ),
                    CustomTextFormField(
                      controller: textController6,
                      keyboardType: typeText,
                      width: width * 0.4,
                      number: 5,
                      showCursor: number == 5 ? showCursor : false,
                      onChange: (text) {
                        log('text6: $text');
                      },
                    ),
                    Container(
                      height: 100,
                      color: Colors.lightGreen[400],
                    ),
                    CustomTextFormField(
                      controller: textController7,
                      keyboardType: typeText,
                      width: width * 0.6,
                      number: 6,
                      showCursor: number == 6 ? showCursor : false,
                      onChange: (text) {
                        log('text7: $text');
                      },
                    ),
                    Container(
                      height: sizeBottomPadding ? height * 0.33 : 0,
                      color: Colors.orange[500],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    textController1.dispose();
    super.dispose();
  }
}
