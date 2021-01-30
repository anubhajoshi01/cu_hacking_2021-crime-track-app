import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/report.dart';
import 'package:flutter_app/models/geolocator.dart';

class ReportInfo extends StatelessWidget {

  final Report report;

  ReportInfo(this.report);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              'Report',
              style: TextStyle(color: Colors.grey[850],
              fontWeight: FontWeight.bold,
              fontSize: 40,
              ),

          ),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[300],
        ),
        body: Column(

            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding:EdgeInsets.all(5),
                  //color: Colors.blueGrey[500],
                  child: Text(

                      'ACTIVE: ${report.active}  \nReport ID: ${report.id}  \nLocation: ${report.address} \nContact: ${report.contactInfo} \nDate Posted: ${report.datePosted}  ',
                      style: TextStyle(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )

              ),
              ),
              Container(
                //color: Colors.blueGrey[500],
                padding:EdgeInsets.all(5),
                child:Text(
                  'Description: ${report.description}',
                    style: TextStyle(
                      color: Colors.grey[900],
                      //fontWeight: FontWeight.bold,
                      fontSize: 20,
                ),
                ),
              ),
            ],

        ));
  }
}
