import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/fuelmodel.dart';

class DBFuelsManager {
  static final DBFuelsManager _instance = DBFuelsManager._internal();
  Future<Database>? databas;

  factory DBFuelsManager() {
    return _instance;
  }

  DBFuelsManager._internal({this.datebase, this.databas}) {
    openDB();
  }

  Database? datebase;

  Future openDB() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'fuels.db');

    // Delete the database
    // await deleteDatabase(path);

    // open the database
    datebase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          // When creating the db, create the table
          await db.execute(
              "CREATE TABLE fuels(id INTEGER PRIMARY KEY AUTOINCREMENT,gasstation TEXT,quantity INTEGER,price INTEGER,datetime INTEGER)");
        });
  }

  // Future checkDb() async {
  //   openDB();
  //   Directory documentDirectory = await getApplicationDocumentsDirectory();
  //   //var db = await getDatabasesPath();
  //   var dbPath = join(documentDirectory.path, "demo.db");
  //   bool exist = await databaseExists(dbPath);
  //   print(exist);
  //   return exist;
  // }

  Future<int> insertFuels(Fuels fuels) async {
    await openDB();
    return await datebase!.insert('fuels', fuels.toMap());
  }

  Future<List<Fuels>> getFuelsList(int _from, int _to) async {
    await openDB();
    // final List<Map<String, dynamic>> maps = await datebase!.query('fuels');

    final List<Map<String, dynamic>> maps = await datebase!.rawQuery(
        "select * from fuels where datetime >= $_from and datetime <= $_to");

    return List.generate(maps.length, (index) {
      return Fuels(
        id: maps[index]['id'],
        gasstation: maps[index]['gasstation'],
        quantity:  maps[index]['quantity'],
        price:  maps[index]['price'],
        datetime: maps[index]['datetime'],
      );
    });
  }

  Future<int> updateFuels(Fuels fuels) async {
    await openDB();
    return await datebase!
        .update('fuels', fuels.toMap(), where: 'id=?', whereArgs: [fuels.id]);
  }

  Future<void> deleteFuels(int id) async {
    await openDB();
    await datebase!.delete("fuels", where: "id = ? ", whereArgs: [id]);
  }

  Future<void> deleteFuelsBetweenTowDate(int fromDate, int toDate) async {
    await openDB();
    await datebase!.delete("fuels",
        where: "datetime >= ? and datetime <= ?",
        whereArgs: [fromDate, toDate]);
  }
}
