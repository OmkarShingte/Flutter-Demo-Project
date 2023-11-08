import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/db_model.dart';

class DbHandler {
  static final DbHandler instance = DbHandler._init();

  factory DbHandler() {
    return instance;
  }

  static Database? _database;

  DbHandler._init();

  Future<Database> get database async {
    if (_database != null)
      return _database!;
    else {
      _database = await _initDB('demo.db');
      return _database!;
    }
  }

  static void makeDBObjectNull() {
    _database = null;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    print('Database path $path');

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final textType1 = 'TEXT';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableDemo ( 
  ${DbFields.id} $idType, 
  ${DbFields.isImportant} $boolType,
  ${DbFields.number} $integerType,
  ${DbFields.title} $textType,
  ${DbFields.description} $textType,
  ${DbFields.time} $textType
  )
''');
  }

  Future<DbModel> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableDemo,
      columns: DbFields.values,
      where: '${DbFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return DbModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<DbModel>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${DbFields.time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableDemo, orderBy: orderBy);

    return result.map((json) => DbModel.fromJson(json)).toList();
  }

  Future<void> createNotes({
    required bool isImportant,
    required int number,
    required String title,
    required String description,
  }) async {
    var k = DbModel(
        isImportant: isImportant,
        number: number,
        title: title,
        description: description,
        createdTime: DateTime.now());
    final db = await instance.database;

    final id = await db.insert(tableDemo, k.toJson());
    print(":$id");
    // return sendLocationModel.copy(id: id);
  }

  Future<List<Map>> getNotes() async {
    final db = await instance.database;
    var record = await db.rawQuery('SELECT * FROM $tableDemo');
    for (var element in record) {
      print("element ${element}");
    }
    print(":$record");
    return record;
  }

  Future<void> updateRecord() async {
    final db = await instance.database;
    int count = await db.rawUpdate(
        'UPDATE $tableDemo SET name = ?, value = ? WHERE name = ?',
        ['updated name', '9876', 'some name']);
    print('updated: $count');
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
