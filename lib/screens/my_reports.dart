import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/navigation_drawer.dart';
import 'package:flutter_app/database/report_db.dart';

class MyReports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyReportsState();
  }
}

class _MyReportsState extends State<MyReports> {
  @override
  Widget build(BuildContext context) {
    ReportDb.getMyActiveReports();
    print("length : ${ReportDb.myActiveReports.length}");
    return Scaffold(
      appBar: AppBar(
        title: Text("My Reports"),
        centerTitle: true,
        backgroundColor: Colors.red[700],
      ),
      drawer: NavigationDrawer(),
    );
  }
}
