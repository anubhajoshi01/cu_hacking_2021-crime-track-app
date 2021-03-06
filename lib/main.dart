import 'package:flutter/material.dart';

import 'package:flutter_app/database/local_report_db.dart';
import 'package:flutter_app/models/geolocator.dart';
import 'package:hive/hive.dart';
import 'app.dart';
import 'database/report_db.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/geolocator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await ReportDb.getReportMap();
  await ReportDb.getReportsList();
  await ReportDb.getActiveReports();

  await ReportDb.getMyActiveReports();
  final localDb = LocalReportDb();
  await localDb.addReport(0);
  await ReportDb.fillTrackLists();
  await Geolocation.initLocation();

  print("latlongstuff");
  print(await Geolocation.getAddressFromLatLong());
  List<double> latlong= await Geolocation.getLatLong();
  print(latlong[0]);
  print(latlong[1]);

  runApp(MyApp());

}

