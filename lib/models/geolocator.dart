import 'package:geolocator/geolocator.dart';
class Geolocation {

  static final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;

  static Position getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      return position;
    }).catchError((e) {
      print(e);
      return null;
    });
  }

  static String getAddressFromLatLng() async {
    Position pos = getCurrentLocation();
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          pos.latitude, pos.longitude);
      Placemark place = p[0];
        return "${place.locality}, ${place.postalCode}, ${place.country}";
    } catch (e) {
      print(e);
      return "Error getting location";
    }
  }

  static String getAddressFromLatLng() async {
    Position pos = getCurrentLocation();
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          pos.latitude, pos.longitude);
      Placemark place = p[0];
      return "${place.locality}, ${place.postalCode}, ${place.country}";
    } catch (e) {
      print(e);
      return "Error getting location";
    }
  }
}