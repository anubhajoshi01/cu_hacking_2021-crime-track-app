import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/report.dart';


class ReportDb{

  static Future<void> getReportMap() async {
    Map<int, Report> reportMap = new Map();
    final firestoreInstance = Firestore.instance;
    await firestoreInstance.collection("Reports").getDocuments().then((value) {
      value.documents.forEach((element) {
        var data = element.data;
        int id = int.parse(data["id"]);
        bool active = data["active"] == "true";
        String address = data["address"];
        String contactInfo = data["contactInfo"];
        List<String> dateTimeList = data["datePosted"].split(" ");
        DateTime datePosted = new DateTime.utc(
            int.parse(dateTimeList[2]), int.parse(dateTimeList[1]),
            int.parse(dateTimeList[0]));
        String description = data["description"];
        double latitude = double.parse(data["latitude"]);
        double longitude = double.parse(data["longitude"]);

        reportMap[id] = new Report(
            id,
            active,
            address,
            contactInfo,
            datePosted,
            description,
            latitude,
            longitude);

        print(
            "id: $id, active:$active, address:$address, contact info:$contactInfo");
      });
    });
    return reportMap;
  }

  static Future<void> getReportsWithId(List<int> ids) async{
    List<Report> reports = new List();
    final firestoreInstance = Firestore.instance;
    await firestoreInstance.collection("Reports").getDocuments().then((value) {
      value.documents.forEach((element) {
        var data = element.data;
        int id = int.parse(data["id"]);
        bool active = data["active"] == "true";
        String address = data["address"];
        String contactInfo = data["contactInfo"];
        List<String> dateTimeList = data["datePosted"].split(" ");
        DateTime datePosted = new DateTime.utc(
            int.parse(dateTimeList[2]), int.parse(dateTimeList[1]),
            int.parse(dateTimeList[0]));
        String description = data["description"];
        double latitude = double.parse(data["latitude"]);
        double longitude = double.parse(data["longitude"]);

        Report r = new Report(
            id,
            active,
            address,
            contactInfo,
            datePosted,
            description,
            latitude,
            longitude);

        if(ids.contains(id)){
          reports.add(r);
        }

        print(
            "id: $id, active:$active, address:$address, contact info:$contactInfo");
      });
    });
    return reports;
  }

  static Future<void> getReportsList() async{
    List<Report> reports = new List();
    final firestoreInstance = Firestore.instance;
    await firestoreInstance.collection("Reports").getDocuments().then((value) {
      value.documents.forEach((element) {
        var data = element.data;
        int id = int.parse(data["id"]);
        bool active = data["active"] == "true";
        String address = data["address"];
        String contactInfo = data["contactInfo"];
        List<String> dateTimeList = data["datePosted"].split(" ");
        DateTime datePosted = new DateTime.utc(
            int.parse(dateTimeList[2]), int.parse(dateTimeList[1]),
            int.parse(dateTimeList[0]));
        String description = data["description"];
        double latitude = double.parse(data["latitude"]);
        double longitude = double.parse(data["longitude"]);

        Report r = new Report(
            id,
            active,
            address,
            contactInfo,
            datePosted,
            description,
            latitude,
            longitude);


          reports.add(r);


        print(
            "id: $id, active:$active, address:$address, contact info:$contactInfo");
      });
    });
    return reports;
  }

  static Future<void> getActiveReports() async{
    List<Report> reports = new List();
    final firestoreInstance = Firestore.instance;
    await firestoreInstance.collection("Reports").getDocuments().then((value) {
      value.documents.forEach((element) {
        var data = element.data;
        int id = int.parse(data["id"]);
        bool active = data["active"] == "true";
        String address = data["address"];
        String contactInfo = data["contactInfo"];
        List<String> dateTimeList = data["datePosted"].split(" ");
        DateTime datePosted = new DateTime.utc(
            int.parse(dateTimeList[2]), int.parse(dateTimeList[1]),
            int.parse(dateTimeList[0]));
        String description = data["description"];
        double latitude = double.parse(data["latitude"]);
        double longitude = double.parse(data["longitude"]);

        Report r = new Report(
            id,
            active,
            address,
            contactInfo,
            datePosted,
            description,
            latitude,
            longitude);

        if(active){
          reports.add(r);
        }

        print(
            "id: $id, active:$active, address:$address, contact info:$contactInfo");
      });
    });
    return reports;
  }
}