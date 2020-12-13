import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbManager {
  static Future<String> dbUrl() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'storage.db');
    return path;
  }


}