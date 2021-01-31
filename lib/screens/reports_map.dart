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
    print("build map");
    ReportDb.getReportsList();
    for (int i = 0; i < ReportDb.reportList.length; i++) {
      print(i);
      print(ReportDb.reportList[i].address);
      print(ReportDb.reportList[i].latitude);
      print(ReportDb.reportList[i].longitude);
      print(ReportDb.reportList[i].active);
      markers.add(Marker(
          markerId: MarkerId("$i"),
          position: LatLng(ReportDb.reportList[i].latitude, ReportDb.reportList[i].longitude),
          icon: (ReportDb.reportList[i].active)
              ? BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
              : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReportInfo(ReportDb.reportList[i])));
          }));
    }
    print("length ${markers.length}");
    return Scaffold(
      appBar: AppBar(
        title: Text("All Reports"),
        backgroundColor: Colors.red[700],
      ),
      drawer: NavigationDrawer(),
      body: GoogleMap(
          markers: markers,
          initialCameraPosition: CameraPosition(
              target: LatLng(Geolocation.latitude, Geolocation.longitude),
              zoom: 12)),
    );
  }
}
