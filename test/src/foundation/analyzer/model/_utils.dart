import 'package:path/path.dart' show join;

String testFilePath(String filename) => join(
    "test", "src", "foundation", "analyzer", "model", "examples", filename);
