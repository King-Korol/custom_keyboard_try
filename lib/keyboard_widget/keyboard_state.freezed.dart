// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'keyboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$KeyboardStateTearOff {
  const _$KeyboardStateTearOff();

  _KeyboardState call(
      {bool showCursor = false,
      String localeKeyboard = localeUk,
      int keyboardType = letterType,
      double heightPadding = 0,
      int number = -1}) {
    return _KeyboardState(
      showCursor: showCursor,
      localeKeyboard: localeKeyboard,
      keyboardType: keyboardType,
      heightPadding: heightPadding,
      number: number,
    );
  }
}

/// @nodoc
const $KeyboardState = _$KeyboardStateTearOff();

/// @nodoc
mixin _$KeyboardState {
  bool get showCursor => throw _privateConstructorUsedError;
  String get localeKeyboard => throw _privateConstructorUsedError;
  int get keyboardType => throw _privateConstructorUsedError;
  double get heightPadding => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KeyboardStateCopyWith<KeyboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyboardStateCopyWith<$Res> {
  factory $KeyboardStateCopyWith(
          KeyboardState value, $Res Function(KeyboardState) then) =
      _$KeyboardStateCopyWithImpl<$Res>;
  $Res call(
      {bool showCursor,
      String localeKeyboard,
      int keyboardType,
      double heightPadding,
      int number});
}

/// @nodoc
class _$KeyboardStateCopyWithImpl<$Res>
    implements $KeyboardStateCopyWith<$Res> {
  _$KeyboardStateCopyWithImpl(this._value, this._then);

  final KeyboardState _value;
  // ignore: unused_field
  final $Res Function(KeyboardState) _then;

  @override
  $Res call({
    Object? showCursor = freezed,
    Object? localeKeyboard = freezed,
    Object? keyboardType = freezed,
    Object? heightPadding = freezed,
    Object? number = freezed,
  }) {
    return _then(_value.copyWith(
      showCursor: showCursor == freezed
          ? _value.showCursor
          : showCursor // ignore: cast_nullable_to_non_nullable
              as bool,
      localeKeyboard: localeKeyboard == freezed
          ? _value.localeKeyboard
          : localeKeyboard // ignore: cast_nullable_to_non_nullable
              as String,
      keyboardType: keyboardType == freezed
          ? _value.keyboardType
          : keyboardType // ignore: cast_nullable_to_non_nullable
              as int,
      heightPadding: heightPadding == freezed
          ? _value.heightPadding
          : heightPadding // ignore: cast_nullable_to_non_nullable
              as double,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$KeyboardStateCopyWith<$Res>
    implements $KeyboardStateCopyWith<$Res> {
  factory _$KeyboardStateCopyWith(
          _KeyboardState value, $Res Function(_KeyboardState) then) =
      __$KeyboardStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool showCursor,
      String localeKeyboard,
      int keyboardType,
      double heightPadding,
      int number});
}

/// @nodoc
class __$KeyboardStateCopyWithImpl<$Res>
    extends _$KeyboardStateCopyWithImpl<$Res>
    implements _$KeyboardStateCopyWith<$Res> {
  __$KeyboardStateCopyWithImpl(
      _KeyboardState _value, $Res Function(_KeyboardState) _then)
      : super(_value, (v) => _then(v as _KeyboardState));

  @override
  _KeyboardState get _value => super._value as _KeyboardState;

  @override
  $Res call({
    Object? showCursor = freezed,
    Object? localeKeyboard = freezed,
    Object? keyboardType = freezed,
    Object? heightPadding = freezed,
    Object? number = freezed,
  }) {
    return _then(_KeyboardState(
      showCursor: showCursor == freezed
          ? _value.showCursor
          : showCursor // ignore: cast_nullable_to_non_nullable
              as bool,
      localeKeyboard: localeKeyboard == freezed
          ? _value.localeKeyboard
          : localeKeyboard // ignore: cast_nullable_to_non_nullable
              as String,
      keyboardType: keyboardType == freezed
          ? _value.keyboardType
          : keyboardType // ignore: cast_nullable_to_non_nullable
              as int,
      heightPadding: heightPadding == freezed
          ? _value.heightPadding
          : heightPadding // ignore: cast_nullable_to_non_nullable
              as double,
      number: number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_KeyboardState implements _KeyboardState {
  const _$_KeyboardState(
      {this.showCursor = false,
      this.localeKeyboard = localeUk,
      this.keyboardType = letterType,
      this.heightPadding = 0,
      this.number = -1});

  @JsonKey()
  @override
  final bool showCursor;
  @JsonKey()
  @override
  final String localeKeyboard;
  @JsonKey()
  @override
  final int keyboardType;
  @JsonKey()
  @override
  final double heightPadding;
  @JsonKey()
  @override
  final int number;

  @override
  String toString() {
    return 'KeyboardState(showCursor: $showCursor, localeKeyboard: $localeKeyboard, keyboardType: $keyboardType, heightPadding: $heightPadding, number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _KeyboardState &&
            const DeepCollectionEquality()
                .equals(other.showCursor, showCursor) &&
            const DeepCollectionEquality()
                .equals(other.localeKeyboard, localeKeyboard) &&
            const DeepCollectionEquality()
                .equals(other.keyboardType, keyboardType) &&
            const DeepCollectionEquality()
                .equals(other.heightPadding, heightPadding) &&
            const DeepCollectionEquality().equals(other.number, number));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showCursor),
      const DeepCollectionEquality().hash(localeKeyboard),
      const DeepCollectionEquality().hash(keyboardType),
      const DeepCollectionEquality().hash(heightPadding),
      const DeepCollectionEquality().hash(number));

  @JsonKey(ignore: true)
  @override
  _$KeyboardStateCopyWith<_KeyboardState> get copyWith =>
      __$KeyboardStateCopyWithImpl<_KeyboardState>(this, _$identity);
}

abstract class _KeyboardState implements KeyboardState {
  const factory _KeyboardState(
      {bool showCursor,
      String localeKeyboard,
      int keyboardType,
      double heightPadding,
      int number}) = _$_KeyboardState;

  @override
  bool get showCursor;
  @override
  String get localeKeyboard;
  @override
  int get keyboardType;
  @override
  double get heightPadding;
  @override
  int get number;
  @override
  @JsonKey(ignore: true)
  _$KeyboardStateCopyWith<_KeyboardState> get copyWith =>
      throw _privateConstructorUsedError;
}
