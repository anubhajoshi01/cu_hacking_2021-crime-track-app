import 'package:flutter/material.dart';
import 'package:flutter_app/models/geolocator.dart';
import 'package:geolocator/geolocator.dart';
import 'app.dart';
import 'database/report_db.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await ReportDb.getReportMap();
  await ReportDb.getReportsList();
  await ReportDb.getActiveReports();
  Location l = new Location();
  Position p = l.getCurrentLocation();
  print(p);

  runApp(MyApp());

}
