import 'dart:developer';

import 'package:custom_keyboard_try/keyboard_widget/keyboard_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KeyboardNotifier extends StateNotifier<KeyboardState> {
  KeyboardNotifier() : super(const KeyboardState());

  void changeShowCursor(bool showCursor) {
    log('KeyboardNotifier changeShowCursor: $showCursor');
    state = state.copyWith(showCursor: showCursor);
  }

  void changeLocaleKeyboard() {
    log('KeyboardNotifier changeLocaleKeyboard');
    if (state.localeKeyboard == localeUk) {
      state = state.copyWith(localeKeyboard: localeRu);
    } else if (state.localeKeyboard == localeRu) {
      state = state.copyWith(localeKeyboard: localeEn);
    } else {
      state = state.copyWith(localeKeyboard: localeUk);
    }
  }

  void changeKeyboardType() {
    log('KeyboardNotifier changeLocaleKeyboard');
    state = state.copyWith(
        keyboardType:
            state.keyboardType == letterType ? numericType : letterType);
  }

  void changeHeightPadding(double offset, double height, int type) {
    log('KeyboardNotifier changeHeightPadding: $height, offset: $offset');
    final heightPadding = (height - offset);
    final showingScreen = height - (height * (type == 0 ? 0.33 : 0.22));
    final heightToScroll = offset - showingScreen;
    log('heightPadding: $heightPadding');
    log('showingScreen: $showingScreen');
    log('heightToScroll: $heightToScroll');
    state =
        state.copyWith(heightPadding: heightToScroll < 0 ? 0 : heightToScroll);
    log('state.heightPadding: ${state.heightPadding}');
  }

  void changeNumber(int number) {
    log('KeyboardNotifier changeNumber: $number');
    state = state.copyWith(number: number);
  }
}

final keyboardProvider =
    StateNotifierProvider.autoDispose<KeyboardNotifier, KeyboardState>(
  (ref) => KeyboardNotifier(),
);
