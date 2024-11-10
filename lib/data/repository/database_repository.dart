import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseRepository {

  Database? _db;

  Future<Database?> _open() async {
    if(_db != null) return _db;
    _db = await openDatabase(
      join(await getDatabasesPath(), "naruto_app.db"),
      onCreate: _onCreate,
      version: 1
    );
    return _db;
  }

  _onCreate(Database? db, int version) async {
    await db?.execute("CREATE TABLE characters(id INTEGER PRIMARY KEY, name TEXT)");
    await db?.execute("CREATE TABLE clans(id INTEGER PRIMARY KEY, name TEXT)");
    await db?.execute("CREATE TABLE villages(id INTEGER PRIMARY KEY, name TEXT)");
    await db?.execute("CREATE TABLE kekkei_genkai(id INTEGER PRIMARY KEY, name TEXT)");
    await db?.execute("CREATE TABLE tailed_beasts(id INTEGER PRIMARY KEY, name TEXT)");
    await db?.execute("CREATE TABLE teams(id INTEGER PRIMARY KEY, name TEXT)");
    await db?.execute("CREATE TABLE akatsuki(id INTEGER PRIMARY KEY, name TEXT)");
  }

  insertData<T>(List<T> items, String tableName,Map<String, Object?> Function(T) toMap) async {
    await _open();
    try {
      await _db?.transaction((it) async {
        var batch = it.batch();
        for(var item in items) {
          batch.insert(tableName, toMap(item));
        }
        await batch.commit(noResult: true);
      });
    } catch(err) {
      throw Exception("Failed to insert elements");
    }
  }

  Future<List<T>?> getData<T>(String tableName, T Function(Map<String, Object?> item) fromMap) async {
    await _open();
    try {
      List<Map<String, Object?>>? result = await _db?.query(tableName);
      return result?.map((it) => fromMap(it)).toList();
    } catch(err) {
      throw Exception("Failed to get elements");
    }
  }

  close() async {
    await _db?.close();
    _db = null;
  }

}