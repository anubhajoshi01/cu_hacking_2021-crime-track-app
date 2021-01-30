import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/models/report.dart';


class ReportDb{

  static Map<int, Report> reportMap = new Map();
  static List<Report> reportList = new List();
  static List<Report> myReports = new List();
  static List<Report> activeReports = new List();

  static Future<void> getReportMap() async {

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

  }

  static Future<void> getReportsWithId(List<int> ids) async{

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
          myReports.add(r);
        }

        print(
            "id: $id, active:$active, address:$address, contact info:$contactInfo");
      });
    });

  }

  static Future<void> getReportsList() async{

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

          reportList.add(r);


        print(
            "id: $id, active:$active, address:$address, contact info:$contactInfo");

      });
    });

  }

  static Future<void> getActiveReports() async{

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
          activeReports.add(r);
        }

        print(
            "id: $id, active:$active, address:$address, contact info:$contactInfo");
      });
    });

  }
}