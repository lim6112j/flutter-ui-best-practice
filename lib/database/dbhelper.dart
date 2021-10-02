import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:gecko_app/models/gecko.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper _db = DBHelper._();
  factory DBHelper() => _db;
  static Database? _database;
  Future<Database> get database async {
    return _database ??= await initDB();
  }
  initDB() async {
    return openDatabase(
    join(await getDatabasesPath(), 'gecko_database.db'),
    // When the database is first created, create a table to store geckos.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE geckos (id INTEGER PRIMARY KEY, name TEXT, age INTEGER, origin TEXT)',
      );
    },
    onUpgrade: _onUpgrade,
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 4,
    );
  }
  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if(oldVersion < newVersion) {
      db.execute("ALTER TABLE geckos ADD COLUMN origin TEXT;");
    }
  }
  // Define a function that inserts geckos into the database
  Future<void> insertGecko(Gecko gecko) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Gecko into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same gecko is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'geckos',
      gecko.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the geckos from the geckos table.
  Future<List<Gecko>> geckos() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Geckos.
    final List<Map<String, dynamic>> maps = await db.query('geckos');

    // Convert the List<Map<String, dynamic> into a List<Gecko>.
    return List.generate(maps.length, (i) {
      return Gecko(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
        origin: maps[i]['origin'],
      );
    });
  }

  Future<void> updateGecko(Gecko gecko) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Gecko.
    await db.update(
      'geckos',
      gecko.toMap(),
      // Ensure that the Gecko has a matching id.
      where: 'id = ?',
      // Pass the Gecko's id as a whereArg to prevent SQL injection.
      whereArgs: [gecko.id],
    );
  }

  Future<void> deleteGecko(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Gecko from the database.
    await db.delete(
      'geckos',
      // Use a `where` clause to delete a specific gecko.
      where: 'id = ?',
      // Pass the Gecko's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}
