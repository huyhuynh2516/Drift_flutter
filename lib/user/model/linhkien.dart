class Component {
  final int? id;
  final String name;
  final String? image;
  final int soluong;
  final double gia;
  final int? categoryId; // liên kết đến bảng LoaiLinhKien
  final String? loaiName; //dùng khi JOIN bảng

  Component({
    this.id,
    required this.name,
    this.image,
    this.soluong = 0,
    this.gia = 0.0,
    this.categoryId,
    this.loaiName,
  });

  // === Convert to Map để lưu vào DB ===
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'name': name,
      'image': image,
      'soluong': soluong,
      'gia': gia,
      'categoryId': categoryId,
    };
    if (id != null) map['id'] = id;
    return map;
  }

  // === Convert từ Map (lấy ra từ DB) ===
  factory Component.fromMap(Map<String, dynamic> map) {
    return Component(
      id: map['id'] as int?,
      name: map['name'] as String,
      image: map['image'] as String?,
      soluong: map['soluong'] as int? ?? 0,
      gia: (map['gia'] as num?)?.toDouble() ?? 0.0,
      categoryId: map['categoryId'] as int?,
      loaiName: map['loaiName'] as String?, // nếu có JOIN với bảng loại
    );
  }

  // === Hàm copyWith tiện dụng ===
  Component copyWith({
    int? id,
    String? name,
    String? image,
    int? soluong,
    double? gia,
    int? categoryId,
    String? loaiName,
  }) {
    return Component(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      soluong: soluong ?? this.soluong,
      gia: gia ?? this.gia,
      categoryId: categoryId ?? this.categoryId,
      loaiName: loaiName ?? this.loaiName,
    );
  }

  @override
  String toString() {
    return 'Component(id: $id, name: $name, soluong: $soluong, gia: $gia, categoryId: $categoryId, loaiName: $loaiName)';
  }
}
