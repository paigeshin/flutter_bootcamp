import 'package:geolocator/geolocator.dart';

class Location {

  double latitude;
  double longitude;

  Future<void> getCurrentLocation() async {
    Position position;
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;

      //유저가 permission을 거절
      //유저가 GPS 닿지 않는 곳이 있음.
    } catch (error) {
      print(error);
    }
  }

}
