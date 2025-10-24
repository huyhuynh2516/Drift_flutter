import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/linhkien.dart';
import '../model/loailinhkien.dart';

class LinhkienDatabaseHelper {
  // --- Singleton ---
  static final LinhkienDatabaseHelper instance = LinhkienDatabaseHelper._init();
  static Database? _database;

  LinhkienDatabaseHelper._init();

  // --- Getter database ---
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('linhkien.db');
    return _database!;
  }

  // --- Khởi tạo database ---
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  // --- Tạo bảng ---
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE LoaiLinhKien (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE LinhKien (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image TEXT,
        soluong INTEGER DEFAULT 0,
        gia REAL DEFAULT 0,
        categoryId INTEGER,
        FOREIGN KEY (categoryId) REFERENCES LoaiLinhKien (id) ON DELETE SET NULL
      )
    ''');

    // --- Thêm loại linh kiện mặc định ---
    const defaultCategories = [
      'MCU (Vi điều khiển)',
      'Cảm biến',
      'Dây dẫn',
      'Điện trở',
      'Tụ điện',
      'Module giao tiếp',
      'Màn hình hiển thị',
      'Nguồn & Pin',
    ];

    for (final name in defaultCategories) {
      await db.insert('LoaiLinhKien', {'name': name});
    }
  }

  // ---------------- CRUD: Loại linh kiện ----------------
  Future<void> insertDefaultCategories() async {
    final db = await instance.database;

    final defaultCategories = [
      {'id': 1, 'name': 'MCU'},
      {'id': 2, 'name': 'Cảm biến'},
      {'id': 3, 'name': 'Module giao tiếp'},
      {'id': 4, 'name': 'IC'},
      {'id': 5, 'name': 'Điện trở'},
      {'id': 6, 'name': 'Tụ điện'},
      {'id': 7, 'name': 'Nguồn'},
      {'id': 8, 'name': 'Màn hình / Hiển thị'},
    ];

    for (var cat in defaultCategories) {
      await db.insert(
        'LoaiLinhKien',
        cat,
        conflictAlgorithm: ConflictAlgorithm.ignore, // tránh trùng ID
      );
    }
  }
  Future<int> createLoai(LoaiLinhKien loai) async {
    final db = await database;
    return await db.insert('LoaiLinhKien', loai.toMap(forInsert: true));
  }

  Future<List<LoaiLinhKien>> getAllLoaiLinhKien() async {
    final db = await instance.database;
    final result = await db.query('LoaiLinhKien');
    return result.map((e) => LoaiLinhKien.fromMap(e)).toList();
  }

  Future<int> updateLoai(LoaiLinhKien loai) async {
    final db = await database;
    return await db.update(
      'LoaiLinhKien',
      loai.toMap(),
      where: 'id = ?',
      whereArgs: [loai.id],
    );
  }

  Future<int> deleteLoai(int id) async {
    final db = await database;
    return await db.delete('LoaiLinhKien', where: 'id = ?', whereArgs: [id]);
  }

  // ---------------- CRUD: Linh kiện ----------------
  Future<int> createLinhKien(Component linhkien) async {
    final db = await database;
    return await db.insert('LinhKien', linhkien.toMap());
  }

  Future<List<Component>> getAllLinhKien() async {
    final db = await instance.database;
    final result = await db.rawQuery('''
    SELECT LinhKien.*, LoaiLinhKien.name AS categoryName
    FROM LinhKien
    LEFT JOIN LoaiLinhKien ON LinhKien.categoryId = LoaiLinhKien.id
  ''');
    return result.map((e) => Component.fromMap(e)).toList();
  }

  Future<Component?> getLinhKienById(int id) async {
    final db = await database;
    final result = await db.query('LinhKien', where: 'id = ?', whereArgs: [id]);
    if (result.isNotEmpty) return Component.fromMap(result.first);
    return null;
  }

  Future<int> updateLinhKien(Component linhkien) async {
    final db = await database;
    return await db.update(
      'LinhKien',
      linhkien.toMap(),
      where: 'id = ?',
      whereArgs: [linhkien.id],
    );
  }

  Future<int> deleteLinhKien(int id) async {
    final db = await database;
    return await db.delete('LinhKien', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAllLinhKien() async {
    final db = await database;
    return await db.delete('LinhKien');
  }

  Future<int> countComponent() async {
    final db = await database;
    final result = await db.rawQuery('SELECT COUNT(*) FROM LinhKien');
    return Sqflite.firstIntValue(result) ?? 0;
  }


  // ---------------- Đóng database ----------------
  Future<void> close() async {
    final db = await _database;
    if (db != null) {
      await db.close();
      _database = null;
    }
  }
  Future<List<Component>> getLinhKienByCategory(int categoryId) async {
    final db = await instance.database;
    final result = await db.query(
      'LinhKien',
      where: 'categoryId = ?',
      whereArgs: [categoryId],
    );
    return result.map((e) => Component.fromMap(e)).toList();
  }


}
