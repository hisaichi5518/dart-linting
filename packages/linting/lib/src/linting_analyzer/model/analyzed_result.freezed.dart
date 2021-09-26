// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'analyzed_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AnalyzedResultTearOff {
  const _$AnalyzedResultTearOff();

  _AnalyzedResult call(
      {required String filePath, required List<Issue> issues}) {
    return _AnalyzedResult(
      filePath: filePath,
      issues: issues,
    );
  }
}

/// @nodoc
const $AnalyzedResult = _$AnalyzedResultTearOff();

/// @nodoc
mixin _$AnalyzedResult {
  String get filePath => throw _privateConstructorUsedError;
  List<Issue> get issues => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AnalyzedResultCopyWith<AnalyzedResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyzedResultCopyWith<$Res> {
  factory $AnalyzedResultCopyWith(
          AnalyzedResult value, $Res Function(AnalyzedResult) then) =
      _$AnalyzedResultCopyWithImpl<$Res>;
  $Res call({String filePath, List<Issue> issues});
}

/// @nodoc
class _$AnalyzedResultCopyWithImpl<$Res>
    implements $AnalyzedResultCopyWith<$Res> {
  _$AnalyzedResultCopyWithImpl(this._value, this._then);

  final AnalyzedResult _value;
  // ignore: unused_field
  final $Res Function(AnalyzedResult) _then;

  @override
  $Res call({
    Object? filePath = freezed,
    Object? issues = freezed,
  }) {
    return _then(_value.copyWith(
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      issues: issues == freezed
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as List<Issue>,
    ));
  }
}

/// @nodoc
abstract class _$AnalyzedResultCopyWith<$Res>
    implements $AnalyzedResultCopyWith<$Res> {
  factory _$AnalyzedResultCopyWith(
          _AnalyzedResult value, $Res Function(_AnalyzedResult) then) =
      __$AnalyzedResultCopyWithImpl<$Res>;
  @override
  $Res call({String filePath, List<Issue> issues});
}

/// @nodoc
class __$AnalyzedResultCopyWithImpl<$Res>
    extends _$AnalyzedResultCopyWithImpl<$Res>
    implements _$AnalyzedResultCopyWith<$Res> {
  __$AnalyzedResultCopyWithImpl(
      _AnalyzedResult _value, $Res Function(_AnalyzedResult) _then)
      : super(_value, (v) => _then(v as _AnalyzedResult));

  @override
  _AnalyzedResult get _value => super._value as _AnalyzedResult;

  @override
  $Res call({
    Object? filePath = freezed,
    Object? issues = freezed,
  }) {
    return _then(_AnalyzedResult(
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      issues: issues == freezed
          ? _value.issues
          : issues // ignore: cast_nullable_to_non_nullable
              as List<Issue>,
    ));
  }
}

/// @nodoc

class _$_AnalyzedResult implements _AnalyzedResult {
  const _$_AnalyzedResult({required this.filePath, required this.issues});

  @override
  final String filePath;
  @override
  final List<Issue> issues;

  @override
  String toString() {
    return 'AnalyzedResult(filePath: $filePath, issues: $issues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AnalyzedResult &&
            (identical(other.filePath, filePath) ||
                const DeepCollectionEquality()
                    .equals(other.filePath, filePath)) &&
            (identical(other.issues, issues) ||
                const DeepCollectionEquality().equals(other.issues, issues)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(filePath) ^
      const DeepCollectionEquality().hash(issues);

  @JsonKey(ignore: true)
  @override
  _$AnalyzedResultCopyWith<_AnalyzedResult> get copyWith =>
      __$AnalyzedResultCopyWithImpl<_AnalyzedResult>(this, _$identity);
}

abstract class _AnalyzedResult implements AnalyzedResult {
  const factory _AnalyzedResult(
      {required String filePath,
      required List<Issue> issues}) = _$_AnalyzedResult;

  @override
  String get filePath => throw _privateConstructorUsedError;
  @override
  List<Issue> get issues => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AnalyzedResultCopyWith<_AnalyzedResult> get copyWith =>
      throw _privateConstructorUsedError;
}
