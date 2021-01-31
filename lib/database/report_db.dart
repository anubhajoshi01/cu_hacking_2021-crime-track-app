import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/database/local_report_db.dart';
import 'package:flutter_app/models/report.dart';


class ReportDb{

  static Map<int, Report> reportMap = new Map();
  static List<Report> reportList = new List();
  static List<Report> myActiveReports = new List();
  static List<Report> activeReports = new List();
  static Map<int, bool> reportEnteredList = new Map();
  static Map<int, bool> myReportEnteredList = new Map();

  static Future<void> initAll() async{
    await getReportMap();
    await getReportsList();
    await getActiveReports();
  }

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

  /*static Future<void> getReportsWithId(List<int> ids) async{

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

        if(ids.contains(id) && reportMap[id] == null){
          myReports.add(r);
        }

        print(
            "id: $id, active:$active, address:$address, contact info:$contactInfo");
      });
    });

  } */

  static Future<void> getMyActiveReports() async{
    final localDb = LocalReportDb();

    final firestoreInstance = Firestore.instance;
    await firestoreInstance.collection("Reports").getDocuments().then((value) {
      value.documents.forEach((element) async {
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

        bool local = await localDb.getId(id);
        if(local != null && local && myReportEnteredList[id] == null && r.active){
          myActiveReports.add(r);
          myReportEnteredList[id] = true;
        }
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

        print(reportEnteredList[id]);
          if(reportEnteredList[id] == null){
            print(true);
            reportEnteredList[id] = true;
            reportList.add(r);
          }


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

        if(active && reportMap[id] == null){
          activeReports.add(r);
        }

        print(
            "id: $id, active:$active, address:$address, contact info:$contactInfo");
      });
    });
  }

  static void createReport(String address, double latitude, double longitude, String contactInfo, String description) async{
    await initAll();
    int id = reportList.length;
    var now = new DateTime.now();
    String date = "${now.day} ${now.month} ${now.year}";
    print(date);
    final firestoreInstance = Firestore.instance;
    await firestoreInstance.collection("Reports")
        .document("$id")
        .setData({
      'id': "$id",
      'active': 'true',
      'address': address,
      'latitude': "$latitude",
      'longitude': "$longitude",
      'contactInfo': contactInfo,
      'datePosted': date,
      'description': description,
    });
  }

  static Future<void> updateData(int id) async {
    try {
      final firestoreInstance = Firestore.instance;
      await firestoreInstance
          .collection("Reports")
          .document("$id")
          .updateData({'active': 'false'});
    } catch (e) {
      print(e.toString());
    }
  }

}
