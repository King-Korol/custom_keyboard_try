import 'dart:developer';

import 'package:custom_keyboard_try/drop_down_widget/custom_text_form_field.dart';
import 'package:custom_keyboard_try/drop_down_widget/keyboard_provider.dart';
import 'package:custom_keyboard_try/drop_down_widget/keyboard_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
      overlays: [SystemUiOverlay.bottom]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: KeyboardDemo(),
    );
  }
}

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
              height * 0.33,
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
                  Container(
                    height: 250,
                    color: Colors.orange[400],
                  ),
                  CustomTextFormField(
                    controller: _controller,
                    onChange: (text) {
                      log('text: $text');
                    },
                  ),
                  // Container(
                  //   height: 250,
                  //   color: Colors.orange[400],
                  // ),
                  Container(
                    height: sizeBottomPadding ? height * 0.33 : 0,
                    color: Colors.orange[500],
                  ),
                ],
              ),
              Positioned(
                left: 240,
                top: 420,
                child: Container(
                  height: 3,
                  width: 3,
                  color: Colors.red,
                ),
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
