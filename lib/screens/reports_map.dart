import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/navigation_drawer.dart';
import 'package:flutter_app/database/report_db.dart';
import 'package:flutter_app/models/geolocator.dart';
import 'package:flutter_app/screens/report_info.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ReportsMap extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReportsMap();
  }
}

class _ReportsMap extends State<ReportsMap> {
  Set<Marker> markers = new HashSet<Marker>();
  GoogleMapController googleMapController;

  static const LatLng _center = const LatLng(45.521563, -122.677433);

  Widget build(BuildContext context) {
    ReportDb.getReportsList();
    for (int i = 0; i < ReportDb.reportList.length; i++) {
      markers.add(new Marker(
          position: LatLng(Geolocation.latitude, Geolocation.longitude),
          icon: (ReportDb.reportList[i].active)
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen)
              : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReportInfo(ReportDb.reportList[i])));
          }));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("All Reports"),
        backgroundColor: Colors.red[700],
      ),
      drawer: NavigationDrawer(),
      body: GoogleMap(
          initialCameraPosition: CameraPosition(
              target: LatLng(Geolocation.latitude, Geolocation.longitude),
              zoom: 12)),
    );
  }
}
