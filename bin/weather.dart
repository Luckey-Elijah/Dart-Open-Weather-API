import 'dart:io';
import 'package:path/path.dart' show PathException;
import 'package:yaml/yaml.dart';

void main(List<String> arguments) {
  // reading the secrets.yaml file
  // stdout.writeln(getSecretKey('secrets.yaml'));
  stdout.writeln(getSecretKey('secrets.yaml'));
}

String getSecretKey(String path) {
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
