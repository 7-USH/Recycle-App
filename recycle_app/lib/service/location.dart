import 'package:geolocator/geolocator.dart';

void getcurrentlocation() async {
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    print("Permission denied");
    Geolocator.requestPermission();
  } else {
    Position currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    print(currentPosition.longitude.toString());
    print(currentPosition.latitude.toString());
  }
}
