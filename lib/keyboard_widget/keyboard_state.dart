import 'package:freezed_annotation/freezed_annotation.dart';

part 'keyboard_state.freezed.dart';

const localeUk = 'uk';
const localeRu = 'ru';
const localeEn = 'en';
const letterType = 0;
const numericType = 1;

@freezed
class KeyboardState with _$KeyboardState {
  const factory KeyboardState({
    @Default(false) bool showCursor,
    @Default(localeUk) String localeKeyboard,
    @Default(letterType) int keyboardType,
    @Default(0) double heightPadding,
  }) = _KeyboardState;
}
