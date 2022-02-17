import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Grocesry {
  final int? id;
  final String name;
  Grocesry({this.id, required this.name});
  factory Grocesry.fromMap(Map<String, dynamic> json) =>
      Grocesry(id: json['id'], name: json['name']);
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._PrivateConstructer();
  static final DatabaseHelper instance = DatabaseHelper._PrivateConstructer();
  Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationSupportDirectory();
    String path = join(documentDirectory.path, 'notes.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    return db
        .execute('''CREATE TABLE notes (id INTEGER PRIMARY KEY, name TEXT)''');
  }

  Future<List<Grocesry>> getGrocery() async {
    Database db = await instance.database;
    var notes = await db.query('notes', orderBy: 'name');
    List<Grocesry> queryList =
        notes.isNotEmpty ? notes.map((e) => Grocesry.fromMap(e)).toList() : [];
    return queryList;
  }
}
