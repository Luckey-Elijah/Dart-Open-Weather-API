import 'dart:io';
import 'package:args/command_runner.dart';
import 'package:open_weather/current_weather.dart';
import '../api.dart';

abstract class WeatherCommand extends Command {
  String loadingMessage;
  static WeatherApi weatherApi = WeatherApi();
  Future<CurrentWeather> getWeather(String city);

  @override
  Future<void> run() async {
    if (argResults.arguments.isEmpty) {
      throw Exception('City is required.');
    }

    final city = argResults.arguments[0];
    final loadingString = loadingMessage + ' $city';

    stdout.write('$loadingString\n');
    var weather = getWeather(city);
    stdout.writeln(weather);
  }
}
