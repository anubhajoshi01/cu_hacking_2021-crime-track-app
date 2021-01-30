import 'package:geolocator/geolocator.dart';
class Geolocation {

  static final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;

  static void getCurrentLocation() async {

    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print("I have been here");
    print(position);
  }

   /*Future<void> Future<String>  async getAddressFromLatLng() async {
    Position pos = _getCurrentLocation();
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          pos.latitude, pos.longitude);
      Placemark place = p[0];
      return "${place.locality}, ${place.postalCode}, ${place.country}";
    } catch (e) {
      print(e);
      return "Error getting location";
    }
  }*/
}
