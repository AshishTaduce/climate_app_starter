import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  Future<Map> fetchWeatherInfo() async {
    Map weatherMap;
    Response response = await get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      weatherMap = jsonDecode(response.body);
    }
    return weatherMap;
  }
}
