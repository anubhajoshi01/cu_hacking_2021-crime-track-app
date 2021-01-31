import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/navigation_drawer.dart';
import 'package:flutter_app/database/report_db.dart';

import 'create_report.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateReport()));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
