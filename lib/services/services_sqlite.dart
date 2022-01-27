import 'dart:async';
import 'dart:io';

import 'package:note_prpject/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';



class SQLiteDbProvider {
  // SQLiteDbProvider._();
  static final SQLiteDbProvider db = SQLiteDbProvider();
  static Database ? _database;

  Future  <Database?> get database async {
    if (_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "NoteDB.db");
    return await openDatabase(
        path, version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE Note ("
                  "id INTEGER PRIMARY KEY,"
                  "text TEXT,"
                  "placeDateTime TEXT,"
                  "userId TEXT"
                  ")"
          );

        }
    );
  }
  Future<List<NoteModel>> getAllProducts() async {
    final db = await database;
    List<Map> results = await db!.query(
        "Note", columns: NoteModel.columns, orderBy: "userId"
    );
    List<NoteModel> products = [];
    results.forEach((element) {
      NoteModel noteModel = NoteModel.fromMap(element);
      print(noteModel.placeDateTime);
      products.add(noteModel);
    });
    return products;
  }
  Future getProductById(int id) async {
    final db = await database;
    var result = await db!.query("Note", where: "id = ", whereArgs: [id]);
    if(result.isNotEmpty){
      return 200;
    }else{
      return 0;
    }
  }
  insert(NoteModel noteModel) async {
    final db = await database;
    var maxIdResult = await db!.rawQuery("SELECT MAX(id)+1 as last_inserted_id FROM Note");
    var id = maxIdResult.first["last_inserted_id"];
    var result = await db.rawInsert(
        "INSERT Into Note (id, text, placeDateTime, userId)"
            " VALUES (?, ?, ?, ?)",
        [id, noteModel.text, noteModel.placeDateTime,noteModel.userId]
    );
    print(result);
    return result;
  }
  update(NoteModel noteModel) async {
    final db = await database;
    var result = await db!.update(
        "Note", noteModel.toMap(), where: "id = ?", whereArgs: [noteModel.id]
    );
    return result;
  }

  delete(int id) async {
    final db = await database;
    db!.delete("Note", where: "id = ?", whereArgs: [id]);
  }
  deleteAll() async {
    final db = await database;
    db!.delete("Note");
  }
}