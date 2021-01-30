import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/report.dart';

class ReportInfo extends StatelessWidget {

  final Report report;

  ReportInfo(this.report);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text("All Reports"),
      centerTitle: true,
      backgroundColor: Colors.red[700],
    ));
  }
}
