import 'dart:io';
import 'package:weather/current_weather.dart';

Future<void> main(List<String> arguments) async {
  var w = CurrentWeather.fromJson(await byCityId(4161438));
  stdout.writeln(w);
}
