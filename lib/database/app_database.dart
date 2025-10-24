import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Products])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Thêm sản phẩm
  Future<int> insertProduct(ProductsCompanion product) =>
      into(products).insert(product);

  // Lấy tất cả sản phẩm
  Future<List<Product>> getAllProducts() => select(products).get();

  // Xoá sản phẩm
  Future<int> deleteProduct(int id) =>
      (delete(products)..where((t) => t.id.equals(id))).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(p.join(dir.path, 'products.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
