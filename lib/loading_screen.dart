import 'package:clima/location_screen.dart';
import 'package:clima/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:clima/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
Location location = Location();
class LoadingScreen extends StatefulWidget {
  Map weatherMap;
  LoadingScreen(this.weatherMap);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


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
    Map weatherMap = widget.weatherMap;

    NetworkHelper helper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?q=${weatherMap['sys']['name']}&APPID=29215e3f55fa8578c8e70af14c5602ab'
    );
    Map result = await helper.fetchWeatherInfo();
    Navigator.pushReplacement(
    context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(weatherMap),
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
