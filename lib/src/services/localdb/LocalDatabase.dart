import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  late Database _database;

  Future<void> initialize() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'local_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tokens(id INTEGER PRIMARY KEY, token TEXT UNIQUE)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertToken(String token) async {
    await _database.insert(
      'tokens',
      {'id': 1, 'token': token},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String?> getToken() async {
    final List<Map<String, dynamic>> tokens = await _database.query('tokens');

    if (tokens.isNotEmpty) {
      return tokens.first['token'];
    } else {
      return null;
    }
  }
}

