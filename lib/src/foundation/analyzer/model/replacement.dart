import 'package:freezed_annotation/freezed_annotation.dart';

part 'replacement.freezed.dart';

@freezed
class Replacement with _$Replacement {
  const factory Replacement({
    required String comment,
    required String replacement,
  }) = _Replacement;
}
