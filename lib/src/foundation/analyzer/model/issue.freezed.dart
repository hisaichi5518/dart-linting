// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'issue.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$IssueTearOff {
  const _$IssueTearOff();

  _Issue call(
      {required String ruleId,
      required Uri documentation,
      required SourceSpan location,
      required Severity severity,
      required String message,
      String? verboseMessage,
      Replacement? suggestion}) {
    return _Issue(
      ruleId: ruleId,
      documentation: documentation,
      location: location,
      severity: severity,
      message: message,
      verboseMessage: verboseMessage,
      suggestion: suggestion,
    );
  }
}

/// @nodoc
const $Issue = _$IssueTearOff();

/// @nodoc
mixin _$Issue {
  String get ruleId => throw _privateConstructorUsedError;
  Uri get documentation => throw _privateConstructorUsedError;
  SourceSpan get location => throw _privateConstructorUsedError;
  Severity get severity => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String? get verboseMessage => throw _privateConstructorUsedError;
  Replacement? get suggestion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $IssueCopyWith<Issue> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IssueCopyWith<$Res> {
  factory $IssueCopyWith(Issue value, $Res Function(Issue) then) =
      _$IssueCopyWithImpl<$Res>;
  $Res call(
      {String ruleId,
      Uri documentation,
      SourceSpan location,
      Severity severity,
      String message,
      String? verboseMessage,
      Replacement? suggestion});

  $ReplacementCopyWith<$Res>? get suggestion;
}

/// @nodoc
class _$IssueCopyWithImpl<$Res> implements $IssueCopyWith<$Res> {
  _$IssueCopyWithImpl(this._value, this._then);

  final Issue _value;
  // ignore: unused_field
  final $Res Function(Issue) _then;

  @override
  $Res call({
    Object? ruleId = freezed,
    Object? documentation = freezed,
    Object? location = freezed,
    Object? severity = freezed,
    Object? message = freezed,
    Object? verboseMessage = freezed,
    Object? suggestion = freezed,
  }) {
    return _then(_value.copyWith(
      ruleId: ruleId == freezed
          ? _value.ruleId
          : ruleId // ignore: cast_nullable_to_non_nullable
              as String,
      documentation: documentation == freezed
          ? _value.documentation
          : documentation // ignore: cast_nullable_to_non_nullable
              as Uri,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as SourceSpan,
      severity: severity == freezed
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as Severity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      verboseMessage: verboseMessage == freezed
          ? _value.verboseMessage
          : verboseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      suggestion: suggestion == freezed
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as Replacement?,
    ));
  }

  @override
  $ReplacementCopyWith<$Res>? get suggestion {
    if (_value.suggestion == null) {
      return null;
    }

    return $ReplacementCopyWith<$Res>(_value.suggestion!, (value) {
      return _then(_value.copyWith(suggestion: value));
    });
  }
}

/// @nodoc
abstract class _$IssueCopyWith<$Res> implements $IssueCopyWith<$Res> {
  factory _$IssueCopyWith(_Issue value, $Res Function(_Issue) then) =
      __$IssueCopyWithImpl<$Res>;
  @override
  $Res call(
      {String ruleId,
      Uri documentation,
      SourceSpan location,
      Severity severity,
      String message,
      String? verboseMessage,
      Replacement? suggestion});

  @override
  $ReplacementCopyWith<$Res>? get suggestion;
}

/// @nodoc
class __$IssueCopyWithImpl<$Res> extends _$IssueCopyWithImpl<$Res>
    implements _$IssueCopyWith<$Res> {
  __$IssueCopyWithImpl(_Issue _value, $Res Function(_Issue) _then)
      : super(_value, (v) => _then(v as _Issue));

  @override
  _Issue get _value => super._value as _Issue;

  @override
  $Res call({
    Object? ruleId = freezed,
    Object? documentation = freezed,
    Object? location = freezed,
    Object? severity = freezed,
    Object? message = freezed,
    Object? verboseMessage = freezed,
    Object? suggestion = freezed,
  }) {
    return _then(_Issue(
      ruleId: ruleId == freezed
          ? _value.ruleId
          : ruleId // ignore: cast_nullable_to_non_nullable
              as String,
      documentation: documentation == freezed
          ? _value.documentation
          : documentation // ignore: cast_nullable_to_non_nullable
              as Uri,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as SourceSpan,
      severity: severity == freezed
          ? _value.severity
          : severity // ignore: cast_nullable_to_non_nullable
              as Severity,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      verboseMessage: verboseMessage == freezed
          ? _value.verboseMessage
          : verboseMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      suggestion: suggestion == freezed
          ? _value.suggestion
          : suggestion // ignore: cast_nullable_to_non_nullable
              as Replacement?,
    ));
  }
}

/// @nodoc

class _$_Issue implements _Issue {
  const _$_Issue(
      {required this.ruleId,
      required this.documentation,
      required this.location,
      required this.severity,
      required this.message,
      this.verboseMessage,
      this.suggestion});

  @override
  final String ruleId;
  @override
  final Uri documentation;
  @override
  final SourceSpan location;
  @override
  final Severity severity;
  @override
  final String message;
  @override
  final String? verboseMessage;
  @override
  final Replacement? suggestion;

  @override
  String toString() {
    return 'Issue(ruleId: $ruleId, documentation: $documentation, location: $location, severity: $severity, message: $message, verboseMessage: $verboseMessage, suggestion: $suggestion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Issue &&
            (identical(other.ruleId, ruleId) ||
                const DeepCollectionEquality().equals(other.ruleId, ruleId)) &&
            (identical(other.documentation, documentation) ||
                const DeepCollectionEquality()
                    .equals(other.documentation, documentation)) &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.severity, severity) ||
                const DeepCollectionEquality()
                    .equals(other.severity, severity)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.verboseMessage, verboseMessage) ||
                const DeepCollectionEquality()
                    .equals(other.verboseMessage, verboseMessage)) &&
            (identical(other.suggestion, suggestion) ||
                const DeepCollectionEquality()
                    .equals(other.suggestion, suggestion)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(ruleId) ^
      const DeepCollectionEquality().hash(documentation) ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(severity) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(verboseMessage) ^
      const DeepCollectionEquality().hash(suggestion);

  @JsonKey(ignore: true)
  @override
  _$IssueCopyWith<_Issue> get copyWith =>
      __$IssueCopyWithImpl<_Issue>(this, _$identity);
}

abstract class _Issue implements Issue {
  const factory _Issue(
      {required String ruleId,
      required Uri documentation,
      required SourceSpan location,
      required Severity severity,
      required String message,
      String? verboseMessage,
      Replacement? suggestion}) = _$_Issue;

  @override
  String get ruleId => throw _privateConstructorUsedError;
  @override
  Uri get documentation => throw _privateConstructorUsedError;
  @override
  SourceSpan get location => throw _privateConstructorUsedError;
  @override
  Severity get severity => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  String? get verboseMessage => throw _privateConstructorUsedError;
  @override
  Replacement? get suggestion => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IssueCopyWith<_Issue> get copyWith => throw _privateConstructorUsedError;
}
