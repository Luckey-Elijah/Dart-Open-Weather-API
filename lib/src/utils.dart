import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

/// Fetches the API Key from the selected path.
String getSecretKey({String path = 'secrets.yaml'}) {
  try {
    var file = File(path);
    if (file?.existsSync() == true) {
      var doc = loadYaml(file.readAsStringSync());
      return doc['open_weather_api_key'] ?? (throw ArgumentError());
    } else {
      throw PathException('File does not exist.');
    }
  } catch (e) {
    stderr.writeln(e);
    stderr.writeln('Could not get API Key from `${path}` file.');
    exit(1);
  }
}

/// Formats contents of a JSON body response [source] nicely.
String prettyJson(String source) {
  var map = json.decode(source);

  var encoder = JsonEncoder.withIndent('  ');

  var pretty = encoder.convert(map);

  return pretty;
}
