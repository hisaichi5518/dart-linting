import 'package:analyzer/diagnostic/diagnostic.dart';
import 'package:source_span/source_span.dart';

import 'replacement.dart';

class Issue {
  final String ruleId;
  final Uri documentation;
  final SourceSpan location;
  final Severity severity;
  final String message;
  final String? verboseMessage;
  final Replacement? suggestion;

  const Issue({
    required this.ruleId,
    required this.documentation,
    required this.location,
    required this.severity,
    required this.message,
    this.verboseMessage,
    this.suggestion,
  });
}
