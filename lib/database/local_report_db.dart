
import 'package:hive/hive.dart';

class LocalReportDb{

  Box box;

  LocalReportDb();

  static Future<LocalReportDb> getDb() async{
    final db = LocalReportDb();
    db.initBox();
    return db;
  }

  Future<void> initBox() async {
    if (this.box == null) {
      this.box = await Hive.openBox("local reports");
    }
  }

  Future<void> addReport(int id) async{
    await this.initBox();
    print("added");
    return await this.box.put(id, true);
  }

  Future<bool> getId(int id) async{
    await this.initBox();
    return this.box.get(id);
  }
}