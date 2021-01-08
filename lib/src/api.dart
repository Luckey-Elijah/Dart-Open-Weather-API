import 'package:open_weather/current_weather.dart';

class WeatherApi {
  String apiKey;

  WeatherApi({apiKey});

  Future<String> getByCity(String city) async => byCityName(city);
  Future<String> getByZip(String zip) async => byZipCode(zip);
  Future<String> getById(int id) async => byCityId(id);
  Future<String> getByCoords(double lat, double lon) => byCoordinates(lat, lon);
}
