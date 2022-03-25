// ignore_for_file: unused_local_variable, deprecated_member_use, avoid_print

import 'package:geolocator/geolocator.dart';


class MyLocation {
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      Position currentPosition;
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        print("Permission denied");
        Geolocator.requestPermission();
      } else {
            Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
            latitude = position.latitude;
            longitude = position.longitude;
      }
      // print(latitude);
    } catch (e) {
      print("ERROR");
    }
  }

  Future<double> getLatitude() async {
    try {
      return latitude;
    } catch (e) {
      print(e);
    }
    return 0;
  }

  Future<double> getLongitude() async {
    try {
      return longitude;
    } catch (e) {
      print(e);
    }
    return 0;
  }
}
