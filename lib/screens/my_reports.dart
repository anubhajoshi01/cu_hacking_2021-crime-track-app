import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/navigation_drawer.dart';
import 'package:flutter_app/database/report_db.dart';
import 'package:flutter_app/models/report.dart';
import 'package:flutter_app/screens/report_info.dart';

import 'create_report.dart';

class MyReports extends StatefulWidget {



  @override
  State<StatefulWidget> createState() {
    return _MyReportsState();
  }
}

class _MyReportsState extends State<MyReports> {

// List<Report> reports = new List();

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    print("init");
    ReportDb.getMyActiveReports();
   /* for(int i = 0; i < ReportDb.myActiveReports.length; i++){
      if(ReportDb.myActiveReports[i].active) {
        reports.add(ReportDb.myActiveReports[i]);
      }
    } */
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild");
    ReportDb.getMyActiveReports();
  print("report length${ReportDb.activeReportsTrack.length}");
    return Scaffold(
      appBar: AppBar(
        title: Text("My Reports"),
        centerTitle: true,
        backgroundColor: Colors.red[700],
      ),
      body: ListView.builder(
        itemCount: ReportDb.activeReportsTrack.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key("${ReportDb.activeReportsTrack[index].id}"),
            child: ListTile(
              title: Text(ReportDb.activeReportsTrack[index].address),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ReportInfo(ReportDb.activeReportsTrack[index])));
              },
            ),
            onDismissed: (direction) {
              print("dismissed");
              ReportDb.updateData(ReportDb.activeReportsTrack[index].id);
              setState(()  {
                 ReportDb.getMyActiveReports();
                ReportDb.activeReportsTrack.removeAt(index);
              });
            },
          );
        },
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
