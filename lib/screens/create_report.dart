
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/geolocator.dart';
import 'package:flutter_app/database/report_db.dart';
import 'package:flutter_app/models/geolocator.dart';

class CreateReport extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CreateReport();
  }

}

class _CreateReport extends State<CreateReport>{
  String descriptionStr = "";
  String infoStr = "";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Submit a report"),
        centerTitle: true,
        backgroundColor: Colors.red[700],

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Text(
              "Enter your contact information below:",
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(3),
            color: Colors.white,
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              onChanged: (input){
                setState(() {
                  infoStr = input;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 2),
            child: Text(
              "Enter a description for the incident/crime ",
              style: TextStyle(
                color: Colors.grey[900],
                fontSize:10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(3),
            color: Colors.white,
            child: TextField(
              obscureText: true,
              keyboardType: TextInputType.text,
              onChanged: (input){
                setState(() {
                  descriptionStr = input;
                });
              },
            ),
          ),
          FlatButton(
              onPressed:(){
                ReportDb.createReport(Geolocation.address, Geolocation.latitude, Geolocation.longitude, infoStr, descriptionStr);
                Navigator.pop(context);

              } ,
              child: Text(
                  "Submit",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900],
                  )
              )
          )
        ],
      ),
    );
  }

}