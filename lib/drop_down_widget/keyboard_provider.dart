import 'dart:developer';

import 'package:custom_keyboard_try/drop_down_widget/keyboard_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeyboardNotifier extends StateNotifier<KeyboardState> {
  KeyboardNotifier() : super(const KeyboardState());

  void changeShowCursor(bool showCursor) {
    log('KeyboardNotifier changeShowCursor: $showCursor');
    state = state.copyWith(showCursor: showCursor);
  }
}

final keyboardProvider =
    StateNotifierProvider.autoDispose<KeyboardNotifier, KeyboardState>(
  (ref) => KeyboardNotifier(),
);
