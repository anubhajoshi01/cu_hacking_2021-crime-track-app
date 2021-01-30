import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyReports extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyReportsState();
  }
}

class _MyReportsState extends State<MyReports> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("All Reports"),
        centerTitle: true,
        backgroundColor: Colors.red[700],
      ),
    );
  }
}
