import 'package:clima/location_screen.dart';
import 'package:clima/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:clima/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  String cityName;
  LoadingScreen(this.cityName);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Location location = Location();
  @override
  void initState() {
    super.initState();
    print('init called');
    getCurrentLocation();
  }

  void getCurrentLocation() async{
    await location.getLocation();
    fetchWeatherData();
  }

  void fetchWeatherData() async {
    String cityName = widget.cityName;

    NetworkHelper helper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=29215e3f55fa8578c8e70af14c5602ab'
    );
    Map result = await helper.fetchWeatherInfo();
    Navigator.pushReplacement(
    context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(result),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    print('Build Called');
    return Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SpinKitPouringHourglass(
                color: Colors.white,
                size: 200.0,
              ),
            ],
          ),
        ),
    );
  }

  @override
  void dispose(){
    super.dispose();
    print('Dispose called');
  }
}
