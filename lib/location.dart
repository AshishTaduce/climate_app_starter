import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;


  Future <void> getLocation() async {
    print('Get Location called');
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    this.latitude = position.latitude;
    this.longitude = position.longitude;
  }
}