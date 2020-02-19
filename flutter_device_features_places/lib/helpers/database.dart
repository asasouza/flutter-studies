import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static Future<sql.Database> database() async {
    final databasePath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(databasePath, 'places.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE place(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final database = await DatabaseHelper.database();
    return database.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> select(String table) async {
    final database = await DatabaseHelper.database();
    return database.query(table);
  }
}
