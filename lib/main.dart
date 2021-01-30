import 'package:flutter/material.dart';
import 'app.dart';
import 'database/report_db.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await ReportDb.getReportMap();
  await ReportDb.getReportsList();
  await ReportDb.getActiveReports();

  runApp(MyApp());

}
