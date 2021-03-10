import 'package:geolocator/geolocator.dart';

class Location {
  double _latitude = 0.0;
  double _longitude = 0.0;

  double getLatitude() {
    return _latitude;
  }

  double getLongitude() {
    return _longitude;
  }

  Future<void> getCurrentLocation() async {
    try {
      print("trying to get the current location");
      // https://github.com/Baseflow/flutter-geolocator/issues/609
      // Also the simulator/ emulator doesn't always play nice with LocationAccuracy.low, you could try to move this to a higher level.
      // <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
      // However after adding that permission, BOTH low and high accuracy requests worked for me. Interesting.
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      print(position);
      _latitude = position.latitude;
      _longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
