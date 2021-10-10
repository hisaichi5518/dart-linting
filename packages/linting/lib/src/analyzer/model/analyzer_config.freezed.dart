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

  _AnalyzerConfig call(
      {required Iterable<Rule> rules,
      required Iterable<String> excludes,
      required String rootFolder}) {
    return _AnalyzerConfig(
      rules: rules,
      excludes: excludes,
      rootFolder: rootFolder,
    );
  }
}

/// @nodoc
const $AnalyzerConfig = _$AnalyzerConfigTearOff();

/// @nodoc
mixin _$AnalyzerConfig {
  Iterable<Rule> get rules => throw _privateConstructorUsedError;
  Iterable<String> get excludes => throw _privateConstructorUsedError;
  String get rootFolder => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalyzerConfigCopyWith<AnalyzerConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyzerConfigCopyWith<$Res> {
  factory $AnalyzerConfigCopyWith(
          AnalyzerConfig value, $Res Function(AnalyzerConfig) then) =
      _$AnalyzerConfigCopyWithImpl<$Res>;
  $Res call(
      {Iterable<Rule> rules, Iterable<String> excludes, String rootFolder});
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
    Object? excludes = freezed,
    Object? rootFolder = freezed,
  }) {
    return _then(_value.copyWith(
      rules: rules == freezed
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as Iterable<Rule>,
      excludes: excludes == freezed
          ? _value.excludes
          : excludes // ignore: cast_nullable_to_non_nullable
              as Iterable<String>,
      rootFolder: rootFolder == freezed
          ? _value.rootFolder
          : rootFolder // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call(
      {Iterable<Rule> rules, Iterable<String> excludes, String rootFolder});
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
    Object? excludes = freezed,
    Object? rootFolder = freezed,
  }) {
    return _then(_AnalyzerConfig(
      rules: rules == freezed
          ? _value.rules
          : rules // ignore: cast_nullable_to_non_nullable
              as Iterable<Rule>,
      excludes: excludes == freezed
          ? _value.excludes
          : excludes // ignore: cast_nullable_to_non_nullable
              as Iterable<String>,
      rootFolder: rootFolder == freezed
          ? _value.rootFolder
          : rootFolder // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AnalyzerConfig extends _AnalyzerConfig {
  const _$_AnalyzerConfig(
      {required this.rules, required this.excludes, required this.rootFolder})
      : super._();

  @override
  final Iterable<Rule> rules;
  @override
  final Iterable<String> excludes;
  @override
  final String rootFolder;

  @override
  String toString() {
    return 'AnalyzerConfig(rules: $rules, excludes: $excludes, rootFolder: $rootFolder)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AnalyzerConfig &&
            (identical(other.rules, rules) ||
                const DeepCollectionEquality().equals(other.rules, rules)) &&
            (identical(other.excludes, excludes) ||
                const DeepCollectionEquality()
                    .equals(other.excludes, excludes)) &&
            (identical(other.rootFolder, rootFolder) ||
                const DeepCollectionEquality()
                    .equals(other.rootFolder, rootFolder)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(rules) ^
      const DeepCollectionEquality().hash(excludes) ^
      const DeepCollectionEquality().hash(rootFolder);

  @JsonKey(ignore: true)
  @override
  _$AnalyzerConfigCopyWith<_AnalyzerConfig> get copyWith =>
      __$AnalyzerConfigCopyWithImpl<_AnalyzerConfig>(this, _$identity);
}

abstract class _AnalyzerConfig extends AnalyzerConfig {
  const factory _AnalyzerConfig(
      {required Iterable<Rule> rules,
      required Iterable<String> excludes,
      required String rootFolder}) = _$_AnalyzerConfig;
  const _AnalyzerConfig._() : super._();

  @override
  Iterable<Rule> get rules => throw _privateConstructorUsedError;
  @override
  Iterable<String> get excludes => throw _privateConstructorUsedError;
  @override
  String get rootFolder => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AnalyzerConfigCopyWith<_AnalyzerConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
