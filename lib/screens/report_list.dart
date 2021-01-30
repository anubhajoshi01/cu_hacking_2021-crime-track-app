import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportList extends StatelessWidget {
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
