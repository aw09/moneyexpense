import 'package:sqflite/sqflite.dart';
import 'dart:async';

//mendukug pemrograman asinkron
import 'dart:io';

//bekerja pada file dan directory
import 'package:path_provider/path_provider.dart';
import 'package:moneyexpense/models/TransactionModel.dart';

final String tableName = 'trx';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;

  DbHelper._createObject();

  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {
    //untuk menentukan nama database dan lokasi yg dibuat
    Directory directory = await getTemporaryDirectory();
    String path = directory.path + 'trx.db';
    print(path);

    //create, read databases
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);

    //mengembalikan nilai object sebagai hasil dari fungsinya
    return todoDatabase;
  }

  //buat tabel baru dengan nama transaction
  void _createDb(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tableName (
          id_transaction	INTEGER PRIMARY KEY,
          transaction_name	TEXT,
          id_category	INTEGER,
          date	TEXT,
          nominal	INTEGER
          )
  ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query(tableName, orderBy: 'date');
    return mapList;
  }

//create databases
  Future<int> insert(TransactionModel object) async {

    Database db = await this.database;
    int count = await db.insert(tableName, object.toMap());
    return count;
  }

//update databases
  Future<int> update(TransactionModel object) async {
    Database db = await this.database;
    int count = await db.update(tableName, object.toMap(),
        where: 'id_transaction=?', whereArgs: [object.idTransaction]);
    return count;
  }

//delete databases
  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete(tableName, where: 'id_transaction=?', whereArgs: [id]);
    return count;
  }

  Future<List<TransactionModel>> getTransactionList() async {
    var transactionMapList = await select();
    int count = transactionMapList.length;
    List<TransactionModel> transactionList = List<TransactionModel>();
    for (int i = 0; i < count; i++) {
      transactionList.add(TransactionModel.fromMap(transactionMapList[i]));
    }
    return transactionList;
  }
}
