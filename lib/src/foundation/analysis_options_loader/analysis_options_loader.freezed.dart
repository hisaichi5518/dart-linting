// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'analysis_options_loader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AnalysisOptionsTearOff {
  const _$AnalysisOptionsTearOff();

  _AnalysisOptions call({required Map<String, Object> options}) {
    return _AnalysisOptions(
      options: options,
    );
  }
}

/// @nodoc
const $AnalysisOptions = _$AnalysisOptionsTearOff();

/// @nodoc
mixin _$AnalysisOptions {
  Map<String, Object> get options => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalysisOptionsCopyWith<AnalysisOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalysisOptionsCopyWith<$Res> {
  factory $AnalysisOptionsCopyWith(
          AnalysisOptions value, $Res Function(AnalysisOptions) then) =
      _$AnalysisOptionsCopyWithImpl<$Res>;
  $Res call({Map<String, Object> options});
}

/// @nodoc
class _$AnalysisOptionsCopyWithImpl<$Res>
    implements $AnalysisOptionsCopyWith<$Res> {
  _$AnalysisOptionsCopyWithImpl(this._value, this._then);

  final AnalysisOptions _value;
  // ignore: unused_field
  final $Res Function(AnalysisOptions) _then;

  @override
  $Res call({
    Object? options = freezed,
  }) {
    return _then(_value.copyWith(
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
    ));
  }
}

/// @nodoc
abstract class _$AnalysisOptionsCopyWith<$Res>
    implements $AnalysisOptionsCopyWith<$Res> {
  factory _$AnalysisOptionsCopyWith(
          _AnalysisOptions value, $Res Function(_AnalysisOptions) then) =
      __$AnalysisOptionsCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, Object> options});
}

/// @nodoc
class __$AnalysisOptionsCopyWithImpl<$Res>
    extends _$AnalysisOptionsCopyWithImpl<$Res>
    implements _$AnalysisOptionsCopyWith<$Res> {
  __$AnalysisOptionsCopyWithImpl(
      _AnalysisOptions _value, $Res Function(_AnalysisOptions) _then)
      : super(_value, (v) => _then(v as _AnalysisOptions));

  @override
  _AnalysisOptions get _value => super._value as _AnalysisOptions;

  @override
  $Res call({
    Object? options = freezed,
  }) {
    return _then(_AnalysisOptions(
      options: options == freezed
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, Object>,
    ));
  }
}

/// @nodoc

class _$_AnalysisOptions extends _AnalysisOptions {
  const _$_AnalysisOptions({required this.options}) : super._();

  @override
  final Map<String, Object> options;

  @override
  String toString() {
    return 'AnalysisOptions(options: $options)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AnalysisOptions &&
            (identical(other.options, options) ||
                const DeepCollectionEquality().equals(other.options, options)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(options);

  @JsonKey(ignore: true)
  @override
  _$AnalysisOptionsCopyWith<_AnalysisOptions> get copyWith =>
      __$AnalysisOptionsCopyWithImpl<_AnalysisOptions>(this, _$identity);
}

abstract class _AnalysisOptions extends AnalysisOptions {
  const factory _AnalysisOptions({required Map<String, Object> options}) =
      _$_AnalysisOptions;
  const _AnalysisOptions._() : super._();

  @override
  Map<String, Object> get options => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AnalysisOptionsCopyWith<_AnalysisOptions> get copyWith =>
      throw _privateConstructorUsedError;
}
