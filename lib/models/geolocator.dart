import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class Location {

  final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  @override
  Future<void> getPermission() async{
    PermissionStatus permission=await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);

    if(permission==PermissionStatus.denied)
    {
      await PermissionHandler()
          .requestPermissions([PermissionGroup.locationAlways]);
    }

    var geolocator=Geolocator();

    GeolocationStatus geolocationStatus=await geolocator.checkGeolocationPermissionStatus();

 Position getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
        _currentPosition = position;
        print("$position");
      var getAddressFromLatLng = _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
    return _currentPosition ;
  }

Future<String> _getAddressFromLatLng() async {

      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
        return _currentAddress;
    }



}