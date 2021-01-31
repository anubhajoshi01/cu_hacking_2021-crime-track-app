import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/my_reports.dart';
import 'package:flutter_app/screens/report_list.dart';
import 'package:flutter_app/screens/reports_map.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.5),
        children: <Widget>[
          ListTile(
            title: Text("All Reports"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReportsMap()));
            },
          ),
          ListTile(
            title: Text("My Reports"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyReports()));
            },
          )
        ],
      ),
    );
  }
}
