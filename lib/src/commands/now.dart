import 'package:open_weather/src/current_weather/current_weather.dart';

import 'weather_command.dart';

class Current extends WeatherCommand {
  @override
  Future<CurrentWeather> getWeather(String city) {
    // TODO: implement getWeather
    throw UnimplementedError();
  }

  @override
  String get description => 'Get the current weather.';

  @override
  String get name => 'now';
}
