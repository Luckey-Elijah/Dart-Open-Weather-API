import 'dart:io';
import 'package:http/http.dart';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';
import 'constants.dart' show currentWeatherBaseUrl;

/// Get CurrentWeather JSON string by by city name.
Future<String> byCityName(
  String city, {
  String stateCode,
  String countryCode,
  String apiKey,
  String baseUrl = currentWeatherBaseUrl,
}) async {
  // Throw error on null city
  if (city == null) {
    throw ArgumentError('City name cannot be null.');
  }

  apiKey ??= getSecretKey('secrets.yaml');

  stateCode = (stateCode == null) ? '' : ',${stateCode}';
  countryCode = (countryCode == null) ? '' : ',${countryCode}';

  var url =
      baseUrl + '?q=${city}' + stateCode + countryCode + '&appid=${apiKey}';
  var res = await get(url);
  var body = '';

  if (res.statusCode == 200) {
    body = res.body;
  } else {
    throw ArgumentError('Made a bad request. Status code ${res.statusCode}.');
  }

  return body;
}

/// Get CurrentWeather JSON string by by City ID
Future<String> byCityId() {}

Future<String> byCoordinates() {}

Future<String> byZipCode() {}

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
