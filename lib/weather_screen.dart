import 'package:clima/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:rflutter_alert/rflutter_alert.dart';


class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}
String cityName;
class _CityScreenState extends State<CityScreen> {
  final myController = TextEditingController();
  Future<Map> fetchWeatherInfo() async {
    print(cityName);
    Response response = await get(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=29215e3f55fa8578c8e70af14c5602ab');

    if (response.statusCode == 200){
      Map weatherMap = jsonDecode(response.body);
      return weatherMap;
    }
    else {
      throw Exception;
    }

  }

  var weatherMap;
  @override
  Widget build(BuildContext context) {




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
              TextField(
                controller: myController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter City',
                  labelText: 'Location',

                ),
                onChanged: (String value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                  setState(() {
                    cityName = myController.text;
                  });
                },
              ),
              FlatButton(
                onPressed: () async {
                  Map data =  await fetchWeatherInfo();
                  try {
                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                          builder: (context) => LoadingScreen(data),
                        ));
                  }
                  catch(e) {
                    print('Location not permitted, please allow location');
                    Alert(
                      context: context,
                      type: AlertType.error,
                      title: "LOCATION DISABLED",
                      desc: "Please permit loaction access",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "OKAY",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                        )
                      ],
                    ).show();
                  }

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
