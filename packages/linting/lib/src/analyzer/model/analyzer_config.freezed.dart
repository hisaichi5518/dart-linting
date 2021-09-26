// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'analyzer_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AnalyzerConfigTearOff {
  const _$AnalyzerConfigTearOff();

  _AnalyzerConfig call({required List<Rule> rules}) {
    return _AnalyzerConfig(
      rules: rules,
    );
  }
}

/// @nodoc
const $AnalyzerConfig = _$AnalyzerConfigTearOff();

/// @nodoc
mixin _$AnalyzerConfig {
  List<Rule> get rules => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalyzerConfigCopyWith<AnalyzerConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyzerConfigCopyWith<$Res> {
  factory $AnalyzerConfigCopyWith(
          AnalyzerConfig value, $Res Function(AnalyzerConfig) then) =
      _$AnalyzerConfigCopyWithImpl<$Res>;
  $Res call({List<Rule> rules});
}

/// @nodoc
class _$AnalyzerConfigCopyWithImpl<$Res>
    implements $AnalyzerConfigCopyWith<$Res> {
  _$AnalyzerConfigCopyWithImpl(this._value, this._then);

  final AnalyzerConfig _value;
  // ignore: unused_field
  final $Res Function(AnalyzerConfig) _then;

  @override
  $Res call({
    Object? rules = freezed,
  }) {
    return _then(_value.copyWith(
      rules: rules == freezed
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<Rule>,
    ));
  }
}

/// @nodoc
abstract class _$AnalyzerConfigCopyWith<$Res>
    implements $AnalyzerConfigCopyWith<$Res> {
  factory _$AnalyzerConfigCopyWith(
          _AnalyzerConfig value, $Res Function(_AnalyzerConfig) then) =
      __$AnalyzerConfigCopyWithImpl<$Res>;
  @override
  $Res call({List<Rule> rules});
}

/// @nodoc
class __$AnalyzerConfigCopyWithImpl<$Res>
    extends _$AnalyzerConfigCopyWithImpl<$Res>
    implements _$AnalyzerConfigCopyWith<$Res> {
  __$AnalyzerConfigCopyWithImpl(
      _AnalyzerConfig _value, $Res Function(_AnalyzerConfig) _then)
      : super(_value, (v) => _then(v as _AnalyzerConfig));

  @override
  _AnalyzerConfig get _value => super._value as _AnalyzerConfig;

  @override
  $Res call({
    Object? rules = freezed,
  }) {
    return _then(_AnalyzerConfig(
      rules: rules == freezed
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as List<Rule>,
    ));
  }
}

/// @nodoc

class _$_AnalyzerConfig implements _AnalyzerConfig {
  const _$_AnalyzerConfig({required this.rules});

  @override
  final List<Rule> rules;

  @override
  String toString() {
    return 'AnalyzerConfig(rules: $rules)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AnalyzerConfig &&
            (identical(other.rules, rules) ||
                const DeepCollectionEquality().equals(other.rules, rules)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(rules);

  @JsonKey(ignore: true)
  @override
  _$AnalyzerConfigCopyWith<_AnalyzerConfig> get copyWith =>
      __$AnalyzerConfigCopyWithImpl<_AnalyzerConfig>(this, _$identity);
}

abstract class _AnalyzerConfig implements AnalyzerConfig {
  const factory _AnalyzerConfig({required List<Rule> rules}) =
      _$_AnalyzerConfig;

  @override
  List<Rule> get rules => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AnalyzerConfigCopyWith<_AnalyzerConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
