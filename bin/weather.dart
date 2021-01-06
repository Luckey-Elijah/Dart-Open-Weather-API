import 'dart:io';
import 'package:path/path.dart' show PathException;
import 'package:yaml/yaml.dart';
import 'package:weather/current_weather.dart';

void main(List<String> arguments) async {
  // reading the secrets.yaml file
  // stdout.writeln(getSecretKey('secrets.yaml'));
  var apiKey = getSecretKey('secrets.yaml');

  var w = CurrentWeather.fromJson(
    await byCityName('Lakeland', currentWeatherBase, apiKey),
  );

  stdout.writeln(w);
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
