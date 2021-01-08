import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:current_forecast_weather_data/current_weather.dart';
import '../api.dart';

abstract class WeatherCommand extends Command {
  static WeatherApi weatherApi = WeatherApi();
  Future<CurrentWeather> getWeather(String city);

  @override
  Future<void> run() async {
    if (argResults.arguments.isEmpty) {
      throw Exception('City is required.');
    }

    final city = argResults.arguments[0];

    var weather = getWeather(city);
    stdout.writeln(await weather);
  }
}
