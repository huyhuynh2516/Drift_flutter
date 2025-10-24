import 'package:flutter/material.dart';
import '../db/LinhKienDatabaseHelper.dart';
import '../model/linhkien.dart';
import '../model/loailinhkien.dart';
import 'component_card.dart';

class ComponentScreen extends StatefulWidget {
  const ComponentScreen({Key? key}) : super(key: key);

  @override
  State<ComponentScreen> createState() => _ComponentScreenState();
}

class _ComponentScreenState extends State<ComponentScreen> {
  List<Component> linhKienList = [];
  List<LoaiLinhKien> loaiList = [];
  int? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  Future<void> _initData() async {
    final db = LinhkienDatabaseHelper.instance;
    final categories = await db.getAllLoaiLinhKien();
    final linhkiens = await db.getAllLinhKien();

    setState(() {
      loaiList = categories;
      linhKienList = linhkiens;
    });
  }

  Future<void> _filterByCategory(int? categoryId) async {
    final db = LinhkienDatabaseHelper.instance;
    List<Component> list;

    if (categoryId == null) {
      list = await db.getAllLinhKien();
    } else {
      list = await db.getLinhKienByCategory(categoryId);
    }

    setState(() {
      selectedCategoryId = categoryId;
      linhKienList = list;
    });
  }

  Future<void> _addNewComponent() async {
    final nameController = TextEditingController();
    final imageController = TextEditingController(text: 'Assets/Images/');
    final soluongController = TextEditingController();
    final giaController = TextEditingController();
    int? selectedLoaiId;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Thêm linh kiện mới'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Tên linh kiện'),
                ),
                TextField(
                  controller: imageController,
                  decoration: const InputDecoration(labelText: 'Đường dẫn hình ảnh (Asset)'),
                ),
                TextField(
                  controller: soluongController,
                  decoration: const InputDecoration(labelText: 'Số lượng'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: giaController,
                  decoration: const InputDecoration(labelText: 'Giá tiền (VNĐ)'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<int>(
                  decoration: const InputDecoration(labelText: 'Loại linh kiện'),
                  value: selectedLoaiId,
                  items: loaiList
                      .map((loai) => DropdownMenuItem<int>(
                    value: loai.id,
                    child: Text(loai.name),
                  ))
                      .toList(),
                  onChanged: (value) => selectedLoaiId = value,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Hủy'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (nameController.text.isEmpty || selectedLoaiId == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Vui lòng nhập đủ thông tin')),
                  );
                  return;
                }

                final newComponent = Component(
                  name: nameController.text,
                  image: imageController.text,
                  soluong: int.tryParse(soluongController.text) ?? 0,
                  gia: double.tryParse(giaController.text) ?? 0,
                  categoryId: selectedLoaiId,
                );

                await LinhkienDatabaseHelper.instance.createLinhKien(newComponent);
                Navigator.pop(context);
                await _filterByCategory(selectedCategoryId);
              },
              child: const Text('Thêm'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh sách linh kiện"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _initData,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewComponent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          // Dropdown chọn loại linh kiện
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<int?>(
              isExpanded: true,
              value: selectedCategoryId,
              hint: const Text("Chọn loại linh kiện"),
              items: [
                const DropdownMenuItem<int?>(
                  value: null,
                  child: Text("Tất cả"),
                ),
                ...loaiList.map(
                      (loai) => DropdownMenuItem<int?>(
                    value: loai.id,
                    child: Text(loai.name),
                  ),
                ),
              ],
              onChanged: (value) => _filterByCategory(value),
            ),
          ),

          // Danh sách linh kiện
          Expanded(
            child: linhKienList.isEmpty
                ? const Center(child: Text("Không có linh kiện nào"))
                : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.85,
              ),
              itemCount: linhKienList.length,
              itemBuilder: (context, index) {
                final lk = linhKienList[index];
                final categoryName = loaiList
                    .firstWhere(
                      (c) => c.id == lk.categoryId,
                  orElse: () => LoaiLinhKien(id: 0, name: "Không xác định"),
                )
                    .name;

                return ComponentCard(
                  linhkien: lk,
                  categoryName: categoryName,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Chọn: ${lk.name}')),
                    );
                  },
                  onEdit: () async {
                    final giaController =
                    TextEditingController(text: lk.gia.toString());
                    final soluongController =
                    TextEditingController(text: lk.soluong.toString());

                    await showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: Text('Sửa ${lk.name}'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: giaController,
                              decoration:
                              const InputDecoration(labelText: 'Giá (VNĐ)'),
                              keyboardType: TextInputType.number,
                            ),
                            TextField(
                              controller: soluongController,
                              decoration:
                              const InputDecoration(labelText: 'Số lượng'),
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Hủy')),
                          ElevatedButton(
                            onPressed: () async {
                              final updated = lk.copyWith(
                                gia: double.tryParse(giaController.text) ?? lk.gia,
                                soluong: int.tryParse(soluongController.text) ??
                                    lk.soluong,
                              );
                              await LinhkienDatabaseHelper.instance
                                  .updateLinhKien(updated);
                              Navigator.pop(context);
                              await _filterByCategory(selectedCategoryId);
                            },
                            child: const Text('Lưu'),
                          ),
                        ],
                      ),
                    );
                  },
                  onDelete: () async {
                    await LinhkienDatabaseHelper.instance.deleteLinhKien(lk.id!);
                    await _filterByCategory(selectedCategoryId);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
