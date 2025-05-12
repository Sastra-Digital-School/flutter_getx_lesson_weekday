import 'dart:io';
import 'package:flutter_project_getx/modules/product/product_model_localdata.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDataBase {
  static final LocalDataBase _instance = LocalDataBase._internal();
  factory LocalDataBase() => _instance;
  LocalDataBase._internal();

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = join(dir.path, 'products.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        price REAL
      )
    ''');
  }

  Future<int> insertProduct(Product product) async {
    final dbClient = await db;
    return await dbClient.insert('products', product.toMap());
  }

  Future<List<Product>> getProducts() async {
    final dbClient = await db;
    final res = await dbClient.query('products');
    return res.map((e) => Product.fromMap(e)).toList();
  }

  Future<int> deleteProduct(int id) async {
    final dbClient = await db;
    return await dbClient.delete('products', where: 'id = ?', whereArgs: [id]);
  }
}
