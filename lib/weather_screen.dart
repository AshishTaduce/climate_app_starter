import 'package:clima/location_screen.dart';
import 'package:clima/main.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  void getLocation() async {
    print('Get Location called');
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);
  }

  Future<Map> fetchWeatherInfo() async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?lat=23&lon=77&appid=4f7b32dc58f4ac156caec77d106358f8');
    Map weatherMap = jsonDecode(response.body);
    return weatherMap;
  }

  var weatherMap;
  @override
  Widget build(BuildContext context) {
    weatherMap = fetchWeatherInfo();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {},
//                  child: Icon(
//                    Icons.arrow_back_ios,
//                    size: 50.0,
//                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: null,
              ),
              FlatButton(
                onPressed: () async {
                  fetchWeatherInfo();
                  Map data = await fetchWeatherInfo();
                  Navigator.push(
                      (context),
                      MaterialPageRoute(
                        builder: (context) => LocationScreen(data),
                      ));
                },
                child: Text(
                  'Get Weather',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Spartan MB',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
