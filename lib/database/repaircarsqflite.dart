import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/repaircarmodel.dart';

class DBRepairCarManager {
  static final DBRepairCarManager _instance = DBRepairCarManager._internal();
  Future<Database>? databas;

  factory DBRepairCarManager() {
    return _instance;
  }

  DBRepairCarManager._internal({this.datebase, this.databas}) {
    openDB();
  }

  Database? datebase;

  Future openDB() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'repaircar.db');

    // Delete the database
    // await deleteDatabase(path);

    // open the database
    datebase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          "CREATE TABLE repaircar(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,quantity INTEGER,price INTEGER,datetime INTEGER,type TEXT,mechanic TEXT,phone INTEGER)");
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

  Future<int> insertRepairCar(RepairCar repaircar) async {
    await openDB();
    return await datebase!.insert('repaircar', repaircar.toMap());
  }

  Future<List<RepairCar>> getRepairCarList(int _from, int _to) async {
    await openDB();

    final List<Map<String, dynamic>> maps = await datebase!.rawQuery(
        "select * from repaircar where datetime >= $_from and datetime <= $_to");
    // await datebase!.query('repaircar');

    return List.generate(maps.length, (index) {
      return RepairCar(
        id: maps[index]['id'],
        name: maps[index]['name'],
        quantity: maps[index]['quantity'],
        price: maps[index]['price'],
        datetime: maps[index]['datetime'],
        type: maps[index]['type'],
        mechanic: maps[index]['mechanic'],
        phone: maps[index]['phone'],
      );
    });
  }

  Future<int> updateRepairCar(RepairCar repaircar) async {
    await openDB();
    // print(repaircar.name);
    // print(repaircar.id);
    // print(repaircar.datetime);
    return
        // , quantity = ${repaircar.quantity} ,price = ${repaircar.price}, datetime = ${repaircar.datetime}
        // quantity INTEGER,price INTEGER,datetime
        await datebase!.rawUpdate(
      'UPDATE repaircar SET name = \'${repaircar.name}\' , quantity = \'${repaircar.quantity}\' , price = \'${repaircar.price}\' , datetime = \'${repaircar.datetime}\' WHERE id = ${repaircar.id}',
    );
    // await datebase!.update('repaircar', repaircar.toMap(),
    //   where: 'id=?', whereArgs: [repaircar.id]);
  }

  Future<void> deleteRepairCar(int id) async {
    await openDB();
    await datebase!.delete("repaircar", where: "id = ? ", whereArgs: [id]);
  }

  Future<void> deleteRepairCarBetweenTowDate(int fromDate, int toDate) async {
    await openDB();
    await datebase!.delete("repaircar",
        where: "datetime >= ? and datetime <= ?",
        whereArgs: [fromDate, toDate]);
  }
}
