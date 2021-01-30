import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/database/report_db.dart';
import 'package:flutter_app/screens/report_info.dart';

class ReportList extends StatelessWidget {

  @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("All Reports"),
          centerTitle: true,
          backgroundColor: Colors.red[700],
        ),
        body:
        ListView.builder(
          itemCount:ReportDb.reportList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: Center(
                  child: Card(
                  child: ListTile(
                    title: Text("$index"),
                  onTap: () {

            Navigator.push(context,
              MaterialPageRoute(builder: (context) => ReportInfo(ReportDb.reportList[index])));
              },
              ),
            )));
          })
      );


    }
  }
