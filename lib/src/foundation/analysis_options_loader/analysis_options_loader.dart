import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaml/yaml.dart';

part 'analysis_options_loader.freezed.dart';

@freezed
class AnalysisOptions with _$AnalysisOptions {
  const AnalysisOptions._();

  const factory AnalysisOptions({
    required Map<String, Object> options,
  }) = _AnalysisOptions;

  Iterable<String> get analyzerExclude {
    final parent = (options['analyzer'] as Map?)?.cast<String, dynamic>() ?? {};
    return (parent['exclude'] as List?)?.cast<String>() ?? [];
  }

  Iterable<String> lintingRules({String key = 'linting'}) {
    final parent = (options[key] as Map?)?.cast<String, dynamic>() ?? {};
    return (parent['rules'] as List?)?.cast<String>() ?? [];
  }
}

class AnalysisOptionsLoader {
  AnalysisOptions loadFromFile(File? file) {
    if (file == null || !file.existsSync()) {
      return const AnalysisOptions(options: {});
    }

    return AnalysisOptions(options: _loadFile(file));
  }

  Map<String, Object> _loadFile(File file) {
    final yamlMap = loadYaml(file.readAsStringSync());
    return _yamlMapToDartMap(yamlMap);
  }

  /// Convert yaml [list] to Dart [List].
  List<Object> _yamlListToDartList(YamlList list) =>
      List.unmodifiable(list.nodes.map<Object>(_yamlNodeToDartObject));

  /// Convert yaml [map] to Dart [Map].
  Map<String, Object> _yamlMapToDartMap(YamlMap map) =>
      Map.unmodifiable(Map<String, Object>.fromEntries(map.nodes.keys
          .whereType<YamlScalar>()
          .where((key) => key.value is String && map.nodes[key]?.value != null)
          .map((key) => MapEntry(
                key.value as String,
                _yamlNodeToDartObject(map.nodes[key]),
              ))));

  /// Convert yaml [node] to Dart [Object].
  Object _yamlNodeToDartObject(YamlNode? node) {
    var object = Object();

    if (node is YamlMap) {
      object = _yamlMapToDartMap(node);
    } else if (node is YamlList) {
      object = _yamlListToDartList(node);
    } else if (node is YamlScalar) {
      object = _yamlScalarToDartObject(node);
    }

    return object;
  }

  /// Convert yaml [scalar] to Dart [Object].
  Object _yamlScalarToDartObject(YamlScalar scalar) => scalar.value as Object;
}
