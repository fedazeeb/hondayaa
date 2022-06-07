import 'dart:async';
import 'dart:io';
import 'package:hondaya/model/alerts.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/fuelmodel.dart';
import '../model/repaircarmodel.dart';
import '../model/transportationmodel.dart';

class DBTransManager {
  static final DBTransManager _instance = DBTransManager._internal();
  Future<Database>? databas;

  factory DBTransManager() {
    return _instance;
  }

  DBTransManager._internal({this.datebase, this.databas}) {
    openDB();
  }

  Database? datebase;

  Future openDB() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'trans.db');

    // Delete the database
    // await deleteDatabase(path);

    // open the database
    datebase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          "CREATE TABLE trans(id INTEGER PRIMARY KEY AUTOINCREMENT,ffrom TEXT,tto TEXT,distance INTEGER,rent INTEGER,datetime INTEGER)");
      await db.execute(
          "CREATE TABLE repaircar(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,quantity INTEGER,price INTEGER,datetime INTEGER,type TEXT,mechanic TEXT,phone INTEGER)");
      await db.execute(
          "CREATE TABLE fuels(id INTEGER PRIMARY KEY AUTOINCREMENT,gasstation TEXT,quantity INTEGER,price INTEGER,datetime INTEGER)");
      await db.execute(
          "CREATE TABLE alerts(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,description TEXT,datetime INTEGER,pushid INTEGER)");
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

  // ---------------------   Insert   ------------------------------
  Future<int> insertTrans(Trans trans) async {
    await openDB();
    return await datebase!.insert('trans', trans.toMap());
  }

  Future<int> insertRepairCar(RepairCar repaircar) async {
    await openDB();
    return await datebase!.insert('repaircar', repaircar.toMap());
  }

  Future<int> insertFuels(Fuels fuels) async {
    await openDB();
    return await datebase!.insert('fuels', fuels.toMap());
  }

  Future<int?> insertAlerts(Alerts alerts) async {
    await openDB();
    alerts.id = await datebase!.insert('alerts', alerts.toMap());
    alerts.pushid = alerts.id;
    print('------------------------');
    print(alerts.id);
    print('------------------------');
    await updateAlerts(alerts);
    return alerts.id;
  }

  // ---------------------   Get All Data  ------------------------
  Future<List<Trans>> getTransList(int _from, int _to) async {
    await openDB();
    // final List<Map<String, dynamic>> maps = await datebase!.query('trans');

    final List<Map<String, dynamic>> maps = await datebase!.rawQuery(
        "select * from trans where datetime >= $_from and datetime <= $_to");

    return List.generate(maps.length, (index) {
      return Trans(
        id: maps[index]['id'],
        ffrom: maps[index]['ffrom'],
        tto: maps[index]['tto'],
        distance: maps[index]['distance'],
        rent: maps[index]['rent'],
        datetime: maps[index]['datetime'],
      );
    });
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

  Future<List<Fuels>> getFuelsList(int _from, int _to) async {
    await openDB();
    // final List<Map<String, dynamic>> maps = await datebase!.query('fuels');

    final List<Map<String, dynamic>> maps = await datebase!.rawQuery(
        "select * from fuels where datetime >= $_from and datetime <= $_to");

    return List.generate(maps.length, (index) {
      return Fuels(
        id: maps[index]['id'],
        gasstation: maps[index]['gasstation'],
        quantity: maps[index]['quantity'],
        price: maps[index]['price'],
        datetime: maps[index]['datetime'],
      );
    });
  }

  Future<List<Alerts>> getAlertsList() async {
    await openDB();
    // final List<Map<String, dynamic>> maps = await datebase!.query('fuels');

    final List<Map<String, dynamic>> maps = await datebase!.rawQuery(
        "select * from alerts");

    return List.generate(maps.length, (index) {
      return Alerts(
        title: maps[index]['title'],
        description: maps[index]['description'],
        pushid: maps[index]['pushid'],
        datetime: maps[index]['datetime'],
        id: maps[index]['id'],
      );
    });
  }

  // ---------------------  Update Data on Table  ----------------------------------

  Future<int> updateTrans(Trans trans) async {
    await openDB();
    return await datebase!
        .update('trans', trans.toMap(), where: 'id=?', whereArgs: [trans.id]);
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

  Future<int> updateAlerts(Alerts alerts) async {
    await openDB();
    // print(repaircar.name);
    // print(repaircar.id);
    // print(repaircar.datetime);
    return
        // , quantity = ${repaircar.quantity} ,price = ${repaircar.price}, datetime = ${repaircar.datetime}
        // quantity INTEGER,price INTEGER,datetime
        await datebase!.rawUpdate(
      'UPDATE alerts SET title = \'${alerts.title}\' , description = \'${alerts.description}\' , pushid = \'${alerts.pushid}\' , datetime = \'${alerts.datetime}\' WHERE id = ${alerts.id}',
    );
    // await datebase!.update('repaircar', repaircar.toMap(),
    //   where: 'id=?', whereArgs: [repaircar.id]);
  }

  //  -------------------  Delete from Tables ------------------

  Future<void> deleteTrans(int id) async {
    await openDB();
    await datebase!.delete("trans", where: "id = ? ", whereArgs: [id]);
  }

  Future<void> deleteTransBetweenTowDate(int fromDate, int toDate) async {
    await openDB();
    await datebase!.delete("trans",
        where: "datetime >= ? and datetime <= ?",
        whereArgs: [fromDate, toDate]);
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

  Future<void> deleteAlerts(int? id) async {
    await openDB();
    await datebase!.delete("alerts", where: "id = ? ", whereArgs: [id]);
  }
}
