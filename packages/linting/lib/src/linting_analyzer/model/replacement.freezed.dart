// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'replacement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReplacementTearOff {
  const _$ReplacementTearOff();

  _Replacement call({required String comment, required String replacement}) {
    return _Replacement(
      comment: comment,
      replacement: replacement,
    );
  }
}

/// @nodoc
const $Replacement = _$ReplacementTearOff();

/// @nodoc
mixin _$Replacement {
  String get comment => throw _privateConstructorUsedError;
  String get replacement => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ReplacementCopyWith<Replacement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReplacementCopyWith<$Res> {
  factory $ReplacementCopyWith(
          Replacement value, $Res Function(Replacement) then) =
      _$ReplacementCopyWithImpl<$Res>;
  $Res call({String comment, String replacement});
}

/// @nodoc
class _$ReplacementCopyWithImpl<$Res> implements $ReplacementCopyWith<$Res> {
  _$ReplacementCopyWithImpl(this._value, this._then);

  final Replacement _value;
  // ignore: unused_field
  final $Res Function(Replacement) _then;

  @override
  $Res call({
    Object? comment = freezed,
    Object? replacement = freezed,
  }) {
    return _then(_value.copyWith(
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      replacement: replacement == freezed
          ? _value.replacement
          : replacement // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ReplacementCopyWith<$Res>
    implements $ReplacementCopyWith<$Res> {
  factory _$ReplacementCopyWith(
          _Replacement value, $Res Function(_Replacement) then) =
      __$ReplacementCopyWithImpl<$Res>;
  @override
  $Res call({String comment, String replacement});
}

/// @nodoc
class __$ReplacementCopyWithImpl<$Res> extends _$ReplacementCopyWithImpl<$Res>
    implements _$ReplacementCopyWith<$Res> {
  __$ReplacementCopyWithImpl(
      _Replacement _value, $Res Function(_Replacement) _then)
      : super(_value, (v) => _then(v as _Replacement));

  @override
  _Replacement get _value => super._value as _Replacement;

  @override
  $Res call({
    Object? comment = freezed,
    Object? replacement = freezed,
  }) {
    return _then(_Replacement(
      comment: comment == freezed
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      replacement: replacement == freezed
          ? _value.replacement
          : replacement // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Replacement implements _Replacement {
  const _$_Replacement({required this.comment, required this.replacement});

  @override
  final String comment;
  @override
  final String replacement;

  @override
  String toString() {
    return 'Replacement(comment: $comment, replacement: $replacement)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Replacement &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.replacement, replacement) ||
                const DeepCollectionEquality()
                    .equals(other.replacement, replacement)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(replacement);

  @JsonKey(ignore: true)
  @override
  _$ReplacementCopyWith<_Replacement> get copyWith =>
      __$ReplacementCopyWithImpl<_Replacement>(this, _$identity);
}

abstract class _Replacement implements Replacement {
  const factory _Replacement(
      {required String comment, required String replacement}) = _$_Replacement;

  @override
  String get comment => throw _privateConstructorUsedError;
  @override
  String get replacement => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ReplacementCopyWith<_Replacement> get copyWith =>
      throw _privateConstructorUsedError;
}
