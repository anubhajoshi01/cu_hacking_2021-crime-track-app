import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateReport extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _CreateReport();
  }

}

class _CreateReport extends State<CreateReport>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("My Reports"),
        centerTitle: true,
        backgroundColor: Colors.red[700],
      ),

    );
  }
}