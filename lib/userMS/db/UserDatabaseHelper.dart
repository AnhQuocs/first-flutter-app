
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/User.dart';

class UserDatabaseHelper {
  static final UserDatabaseHelper instance = UserDatabaseHelper._init();

  static Database? _database;
  UserDatabaseHelper._init();

  Future<Database> get database async {
    if(_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        email TEXT NOT NULL,
        phone TEXT NOT NULL,
        avatar TEXT,
        dateOfBirth TEXT NOT NULL
      )
      '''
    );

    // create mock data
    await _insertSampleData(db);
  }

  // insert mock data
  Future _insertSampleData(Database db) async {
    final List<Map<String, dynamic>> sampleUsers = [
      {
        'name': 'AnhQuoc',
        'email': 'anhquocs@gmail.com',
        'phone': '0987678987',
        'avatar': null,
        'dateOfBirth': DateTime(2005, 7, 30).toIso8601String()
      },
      {
        'name': 'AnhQuoc 2',
        'email': 'anhquoc2s@gmail.com',
        'phone': '0987678987',
        'avatar': null,
        'dateOfBirth': DateTime(2005, 7, 30).toIso8601String()
      },
      {
        'name': 'AnhQuoc 3',
        'email': 'anhquoc3s@gmail.com',
        'phone': '0987678987',
        'avatar': null,
        'dateOfBirth': DateTime(2005, 7, 30).toIso8601String()
      },
      {
        'name': 'AnhQuoc 4',
        'email': 'anhquoc4s@gmail.com',
        'phone': '0987678987',
        'avatar': null,
        'dateOfBirth': DateTime(2005, 7, 30).toIso8601String()
      },
      {
        'name': 'AnhQuoc 5',
        'email': 'anhquoc5s@gmail.com',
        'phone': '0987678987',
        'avatar': null,
        'dateOfBirth': DateTime(2005, 7, 30).toIso8601String()
      }
    ];

    // insert per person to db
    for(final userData in sampleUsers) {
      await db.insert("users", userData);
    }

    Future close() async {
      final db = await instance.database;
      db.close();
    }
  }

  // Create - Add new user
  Future<int> createUser(User user) async {
    final db = await instance.database;
    return await db.insert('users', user.toMap());
  }

  // Read - get all users
  Future<List<User>> getAllUsers() async {
    final db = await instance.database;
    final result = await db.query("users");

    return result.map((map) => User.fromMap(map)).toList();
  }

  // Read - get user by id
  Future<User?> getUserById(int id) async {
    final db = await instance.database;
    final maps = await db.query('users', where: 'id = ?', whereArgs: [id]);

    if(maps.isNotEmpty) {
      return User.fromMap(maps.first);
    }

    return null;
  }

  // Update - update user
  Future<int> updateUser(User user) async {
    final db = await instance.database;
    return await db.update(
      'users',
      user.toMap(),
      where: 'id = ?',
      whereArgs: [user.id]
    );
  }

  // Delete - delete user
  Future<int> deleteUser(int id) async {
    final db = await instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }

  // Delete - delete all users
  Future<int> deleteAllUsers() async {
    final db = await instance.database;
    return await db.delete('users');
  }

  // count number of users
  Future<int> countUsers() async {
    final db = await instance.database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM users');
    return Sqflite.firstIntValue(result) ?? 0;
  }
}