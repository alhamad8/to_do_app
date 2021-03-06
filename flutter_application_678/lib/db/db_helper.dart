import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:todo/models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('not null db');
      return;
    } else {
      try {
        String _path = await getDatabasesPath() + 'task.db';
        debugPrint('in database path');
        _db = await openDatabase(_path, version: _version,
            onCreate: (Database db, int version) async {
          // When creating the db, create the table
          return db.execute(
            'CREATE TABLE $_tableName ('
            'id INTEGER PRIMARY KEY AUTOINCREMENT, '
            'title STRING, note TEXT, date STRING, '
            'startTime STRING, endTime STRING, '
            'remind INTEGER, repeat STRING, '
            'color INTEGER, '
            'isCompleted INTEGER)',
          );
        });
        print('Data Base Created');
      } catch (e) {
        print(e);
      }
    }
  }

  static Future<int> insert(Task? task) async {
    try {
      print('isert Function called!');
      return await _db!.insert(_tableName, task!.toJson());
    } catch (e) {
      print('we are here');
      return 90000;
    }
  }

  static Future<int> delete(Task task) async {
    print('delete Function called!');
    return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<int> deleteAll() async {
    print('delete All Function called!');
    return await _db!.delete(_tableName,);
  }

  static Future<List<Map<String, dynamic>>> query(/*Task task*/) async {
    print('query Function called');
    return await _db!.query(_tableName);
  }

  static Future<int> Update(int id) async {
    print('updated Function called!');
    return await _db!.rawUpdate('''
  UPDATE tasks
  SET isCompleted = ?
  WHERE id = ?
''', [1, id]);
  }
}
