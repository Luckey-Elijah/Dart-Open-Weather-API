import 'package:http/http.dart';

Future<dynamic> byCityName(
  String city,
  String baseUrl,
  String apiKey, {
  int stateCode,
  int countryCode,
}) async {
  var url = baseUrl + '?q=${city}&appid=${apiKey}';
  var body = (await get(url)).body;
  return body;
}
