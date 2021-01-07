import 'dart:io';
import 'package:weather/current_weather.dart';

void main(List<String> arguments) async {
  var w = CurrentWeather.fromJson(
    await byCityName('Lakeland', stateCode: 'FL', countryCode: 'US'),
  );

  stdout.writeln(w);
}
