import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:reportapps/models/kode_model.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  Future<Database> initDb() async {
//untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'model.db';
//create, read databases
    var modelDatabase = openDatabase(path,
        version: 9, onCreate: _createDb, onUpgrade: _onUpgrade);
//mengembalikan nilai object sebagai hasil dari fungsinya
    return modelDatabase;
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    _createDb(db, newVersion);
  }

  void _createDb(Database db, int version) async {
    var batch = db.batch();
    batch.execute('DROP TABLE IF EXISTS model');
    batch.execute('''
    CREATE TABLE item (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    kode INTEGER,
    pemasukan INTEGER,
    pengeluaran INTEGER,
    pendapatan INTEGER
    )
    ''');
    await batch.commit();
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.initDb();
    var mapList = await db.query('model', orderBy: 'name');
    return mapList;
  }

  Future<int> insert(KodeModel object) async {
    Database db = await this.initDb();
    int count = await db.insert('model', object.toMap());
    return count;
  }

  Future<int> update(KodeModel object) async {
    Database db = await this.initDb();
    int count = await db.update('item', object.toMap(),
        where: 'kode=?', whereArgs: [object.kode]);
    return count;
  }

  Future<int> delete(int kode) async {
    Database db = await this.initDb();
    int count = await db.delete('model', where: 'kode=?', whereArgs: [kode]);
    return count;
  }

  Future<List<KodeModel>> getItemList() async {
    var modelMapList = await select();
    int count = modelMapList.length;
    List<KodeModel> modelList = [];
    for (int i = 0; i < count; i++) {
      modelList.add(KodeModel.fromMap(modelMapList[i]));
    }
    return modelList;
  }

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }
}
