import 'package:current_forecast_weather_data/current_weather.dart';

import 'weather_command.dart';

class Current extends WeatherCommand {
  @override
  Future<CurrentWeather> getWeather(String city) async =>
      CurrentWeather.fromJson(await byCityName(city));

  @override
  String get description => 'Get the current weather.';

  @override
  String get name => 'now';
}
