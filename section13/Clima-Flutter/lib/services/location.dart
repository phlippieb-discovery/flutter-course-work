import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double lon;

  Future<void> loadCurrent() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      print('Caught an exception while loading current location: $e');
    }
  }
}
