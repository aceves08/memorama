import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> _initDB() async {
    final io.Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    String path = join(appDocumentsDir.path, "memorama.db");

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE partidas (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fecha TEXT NOT NULL,
            ganadas INTEGER NOT NULL,
            perdidas INTEGER NOT NULL,
            movimientos INTEGER NOT NULL,
            tiempo INTEGER NOT NULL,
            cartas TEXT NOT NULL
          )
        ''');
      },
    );
  }

  static Future<Database> get database async {
    return await _initDB();
  }

  static Future<void> guardarPartida(
      String fecha, int ganadas, int perdidas, int movimientos, int tiempo, List<String> cartas) async {
    final db = await database;
    await db.insert(
      'partidas',
      {
        'fecha': fecha,
        'ganadas': ganadas,
        'perdidas': perdidas,
        'movimientos': movimientos,
        'tiempo': tiempo,
        'cartas': cartas.join(','),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> obtenerPartidas() async {
    final db = await database;
    return await db.query('partidas');
  }
}