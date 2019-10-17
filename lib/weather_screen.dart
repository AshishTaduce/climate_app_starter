import 'package:clima/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}
class _CityScreenState extends State<CityScreen> {
  final myController = TextEditingController();

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
              ),
              FlatButton(
                onPressed: () async {
                  try {
                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                          builder: (context) => LoadingScreen(myController.text),
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
