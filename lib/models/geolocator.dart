import 'package:geolocator/geolocator.dart';
class Geolocation {

  static final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;

  static Future<Position> getCurrentLocation() async{
    Position p = await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return p;
  }

  static Future<String> getAddressFromLatLong() async {
    Position pos = await getCurrentLocation();
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

  static Future<List<double>> getLatLong() async{
    Position pos = await getCurrentLocation();
    List<double> latlong = new List();
    latlong.add(pos.latitude);
    latlong.add(pos.longitude);
    return latlong;
  }
}