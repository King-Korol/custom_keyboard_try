// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

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

  _KeyboardState call({bool showCursor = false}) {
    return _KeyboardState(
      showCursor: showCursor,
    );
  }
}

/// @nodoc
const $KeyboardState = _$KeyboardStateTearOff();

/// @nodoc
mixin _$KeyboardState {
  bool get showCursor => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $KeyboardStateCopyWith<KeyboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeyboardStateCopyWith<$Res> {
  factory $KeyboardStateCopyWith(
          KeyboardState value, $Res Function(KeyboardState) then) =
      _$KeyboardStateCopyWithImpl<$Res>;
  $Res call({bool showCursor});
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
  }) {
    return _then(_value.copyWith(
      showCursor: showCursor == freezed
          ? _value.showCursor
          : showCursor // ignore: cast_nullable_to_non_nullable
              as bool,
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
  $Res call({bool showCursor});
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
  }) {
    return _then(_KeyboardState(
      showCursor: showCursor == freezed
          ? _value.showCursor
          : showCursor // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_KeyboardState implements _KeyboardState {
  const _$_KeyboardState({this.showCursor = false});

  @JsonKey(defaultValue: false)
  @override
  final bool showCursor;

  @override
  String toString() {
    return 'KeyboardState(showCursor: $showCursor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _KeyboardState &&
            (identical(other.showCursor, showCursor) ||
                const DeepCollectionEquality()
                    .equals(other.showCursor, showCursor)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(showCursor);

  @JsonKey(ignore: true)
  @override
  _$KeyboardStateCopyWith<_KeyboardState> get copyWith =>
      __$KeyboardStateCopyWithImpl<_KeyboardState>(this, _$identity);
}

abstract class _KeyboardState implements KeyboardState {
  const factory _KeyboardState({bool showCursor}) = _$_KeyboardState;

  @override
  bool get showCursor => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$KeyboardStateCopyWith<_KeyboardState> get copyWith =>
      throw _privateConstructorUsedError;
}
