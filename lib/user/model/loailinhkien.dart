class LoaiLinhKien {
  final int? id;
  final String name;

  LoaiLinhKien({this.id, required this.name});

  Map<String, dynamic> toMap({bool forInsert = false}) {
    final map = {'name': name};
    if (!forInsert && id != null) {
      map['id'] = id as String;
    }
    return map;
  }

  factory LoaiLinhKien.fromMap(Map<String, dynamic> map) {
    return LoaiLinhKien(
      id: map['id'] as int?,
      name: map['name'] as String,
    );
  }

  @override
  String toString() => 'LoaiLinhKien(id: $id, name: $name)';
}
