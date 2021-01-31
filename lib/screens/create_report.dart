
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Text(
              "Enter your contact information below:",
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(3),
            color: Colors.white,
            child: TextField(
              keyboardType: TextInputType.text,
              onChanged: (input){
                setState(() {
                  infoStr = input;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Text(
              "Enter a description for the incident/crime ",
              style: TextStyle(
                color: Colors.grey[900],
                fontSize:20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(3),
            color: Colors.white,
            child: TextField(
              keyboardType: TextInputType.text,
              onChanged: (input){
                setState(() {
                  descriptionStr = input;
                });
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 300.0, horizontal: 5.0),
          ),
          FlatButton(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            color: Colors.red,
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
      ))),
    );
  }

}