import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'linhkien_database.g.dart';

// ------------------- TABLE: LoaiLinhKien -------------------
class LoaiLinhKiens extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

// ------------------- TABLE: LinhKien -------------------
class LinhKiens extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get image => text().nullable()();
  IntColumn get soluong => integer().withDefault(const Constant(0))();
  RealColumn get gia => real().withDefault(const Constant(0.0))();
  IntColumn get categoryId =>
      integer().nullable().references(LoaiLinhKiens, #id, onDelete: KeyAction.setNull)();
}

// ------------------- DATABASE -------------------
@DriftDatabase(tables: [LoaiLinhKiens, LinhKiens])
class LinhKienDatabase extends _$LinhKienDatabase {
  LinhKienDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();

      // --- Insert seed categories (loại linh kiện) ---
      final defaultCategories = [
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
        // dùng companion để insert
        await into(loaiLinhKiens).insert(LoaiLinhKiensCompanion.insert(name: name));
      }
    },

    // (tùy chọn) onUpgrade: bạn có thể migrate từ DB cũ ở đây nếu cần
    // onOpen: (db) async { ... }
  );

  // LoaiLinhKien CRUD
  Future<List<LoaiLinhKien>> getAllLoai() => select(loaiLinhKiens).get();
  Future<int> insertLoai(LoaiLinhKien loai) => into(loaiLinhKiens).insert(loai);
  Future<int> deleteLoai(int id) =>
      (delete(loaiLinhKiens)..where((tbl) => tbl.id.equals(id))).go();

  // LinhKien CRUD
  Future<List<LinhKien>> getAllLinhKien() => select(linhKiens).get();
  Future<int> insertLinhKien(LinhKien data) => into(linhKiens).insert(data);
  Future<bool> updateLinhKienData(LinhKien data) => update(linhKiens).replace(data);
  Future<int> deleteLinhKien(int id) =>
      (delete(linhKiens)..where((tbl) => tbl.id.equals(id))).go();

  Future<List<LinhKien>> getLinhKienByCategory(int id) =>
      (select(linhKiens)..where((tbl) => tbl.categoryId.equals(id))).get();
}

// ------------------- OPEN DATABASE -------------------
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'linhkien.db');
    return NativeDatabase(File(path));
  });
}
