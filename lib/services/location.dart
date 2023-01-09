import 'package:geolocator/geolocator.dart';

class Location {
  double lattitude = 0;
  double longtitude = 0;

  Future<void> getCurrentLocation() async {
// LocationPermission permission = await Geolocator.checkPermission();
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      lattitude = await position.latitude;
      longtitude = await position.longitude;
    } catch (e) {
      Geolocator.requestPermission();
      print(e);
    }
  }
}

// if (permission == LocationPermission.denied ||
//     permission == LocationPermission.deniedForever) {
//   LocationPermission requestPermission =
//       await Geolocator.requestPermission();
//   Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.low);
//   devicePosition = await position;
//   print(position);
// } else {
//   Position position = await Geolocator.getCurrentPosition(
//       desiredAccuracy: LocationAccuracy.low);
//   devicePosition = await position;
//   print(position);
// }
// }
