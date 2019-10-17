import 'package:http/http.dart';
import 'dart:convert';


class NetworkHelper{
  String url;
  final String api_key = '29215e3f55fa8578c8e70af14c5602ab';
  NetworkHelper(this.url);

  Future<Map> fetchWeatherInfo() async{
  Map weatherMap;
  Response response = await get(url);
  print(response.statusCode);
  if (response.statusCode == 200){
    weatherMap = jsonDecode(response.body);
  }
  return weatherMap;
  }
}