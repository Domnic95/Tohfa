
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    String path = join(await getDatabasesPath(), 'user_list.db');
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  static Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE items(
        id INTEGER PRIMARY KEY,
        userId INTEGER,
        title TEXT,
        body TEXT
      )
    ''');
  }

  // static Future<int> insertUser(UserModel user) async {
  //   Database db = await database;
  //   return await db.insert('items', user.toJson());
  // }
  //
  // static Future<void> insertUsers(List<UserModel> users) async {
  //   Database db = await database;
  //
  //   // Get existing user IDs from the database
  //   List<int> existingUserIds = await _getExistingUserIds(db);
  //
  //   var batch = db.batch();
  //
  //   for (var user in users) {
  //     // Check if the user ID already exists in the database
  //     if (!existingUserIds.contains(user.id)) {
  //       batch.insert('items', user.toJson());
  //       existingUserIds.add(user.id!); // Add the user ID to the list to prevent duplicates
  //     }
  //   }
  //
  //   await batch.commit();
  // }
  //
  // static Future<List<int>> _getExistingUserIds(Database db) async {
  //   List<Map<String, dynamic>> maps = await db.query('items', columns: ['id']);
  //   return maps.map<int>((map) => map['id'] as int).toList();
  // }
  //
  // static Future<List<UserModel>> getUsers() async {
  //   Database db = await database;
  //   List<Map<String, dynamic>> maps = await db.query('items');
  //   return List.generate(maps.length, (index) {
  //     return UserModel.fromJson(maps[index]);
  //   });
  // }
  //
  // static Future<int> updateUser(UserModel user) async {
  //   Database db = await database;
  //   return await db
  //       .update('items', user.toJson(), where: 'id = ?', whereArgs: [user.id]);
  // }

  static Future<int> deleteUser(int userId) async {
    Database db = await database;
    return await db.delete('items', where: 'id = ?', whereArgs: [userId]);
  }

  static Future<int> removeAllUsers() async {
    Database db = await database;
    return await db.delete('items'); // Deletes all records in the 'items' table
  }

  // Function to clear the entire database
  static Future<void> clearDatabase() async {
    Database db = await database;
    // Drop existing tables
    await db.execute('DROP TABLE IF EXISTS items');
    // Recreate the tables
    await _createDb(db, 1);
  }
}
