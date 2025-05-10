import 'package:navio_mobile/models/note.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../models/shopping_item.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('shopping_list.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<int> createItem(ShoppingItem item) async {
    final db = await instance.database;
    return await db.insert('shopping_items', item.toMap());
  }

  Future<List<ShoppingItem>> getItems() async {
    final db = await instance.database;
    final result = await db.query('shopping_items');
    return result.map((map) => ShoppingItem.fromMap(map)).toList();
  }

  Future<int> updateItem(ShoppingItem item) async {
    final db = await instance.database;
    return await db.update(
      'shopping_items',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteItem(int id) async {
    final db = await instance.database;
    return await db.delete('shopping_items', where: 'id = ?', whereArgs: [id]);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE shopping_items(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        isCompleted INTEGER NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE notes(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        content TEXT NOT NULL,
        createdAt TEXT NOT NULL
      )
    ''');
  }

  // メモ関連のメソッド
  Future<int> createNote(Note note) async {
    final db = await instance.database;
    return await db.insert('notes', note.toMap());
  }

  Future<List<Note>> getNotes() async {
    final db = await instance.database;
    final result = await db.query('notes', orderBy: 'createdAt DESC');
    return result.map((map) => Note.fromMap(map)).toList();
  }

  Future<int> updateNote(Note note) async {
    final db = await instance.database;
    return await db.update(
      'notes',
      note.toMap(),
      where: 'id = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> deleteNote(int id) async {
    final db = await instance.database;
    return await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
