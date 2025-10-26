// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linhkien_database.dart';

// ignore_for_file: type=lint
class $LoaiLinhKiensTable extends LoaiLinhKiens
    with TableInfo<$LoaiLinhKiensTable, LoaiLinhKien> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LoaiLinhKiensTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'loai_linh_kiens';
  @override
  VerificationContext validateIntegrity(
    Insertable<LoaiLinhKien> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LoaiLinhKien map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LoaiLinhKien(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $LoaiLinhKiensTable createAlias(String alias) {
    return $LoaiLinhKiensTable(attachedDatabase, alias);
  }
}

class LoaiLinhKien extends DataClass implements Insertable<LoaiLinhKien> {
  final int id;
  final String name;
  const LoaiLinhKien({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  LoaiLinhKiensCompanion toCompanion(bool nullToAbsent) {
    return LoaiLinhKiensCompanion(id: Value(id), name: Value(name));
  }

  factory LoaiLinhKien.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LoaiLinhKien(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  LoaiLinhKien copyWith({int? id, String? name}) =>
      LoaiLinhKien(id: id ?? this.id, name: name ?? this.name);
  LoaiLinhKien copyWithCompanion(LoaiLinhKiensCompanion data) {
    return LoaiLinhKien(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LoaiLinhKien(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LoaiLinhKien && other.id == this.id && other.name == this.name);
}

class LoaiLinhKiensCompanion extends UpdateCompanion<LoaiLinhKien> {
  final Value<int> id;
  final Value<String> name;
  const LoaiLinhKiensCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  LoaiLinhKiensCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<LoaiLinhKien> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  LoaiLinhKiensCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return LoaiLinhKiensCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LoaiLinhKiensCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $LinhKiensTable extends LinhKiens
    with TableInfo<$LinhKiensTable, LinhKien> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LinhKiensTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
    'image',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _soluongMeta = const VerificationMeta(
    'soluong',
  );
  @override
  late final GeneratedColumn<int> soluong = GeneratedColumn<int>(
    'soluong',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _giaMeta = const VerificationMeta('gia');
  @override
  late final GeneratedColumn<double> gia = GeneratedColumn<double>(
    'gia',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES loai_linh_kiens (id) ON DELETE SET NULL',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    image,
    soluong,
    gia,
    categoryId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'linh_kiens';
  @override
  VerificationContext validateIntegrity(
    Insertable<LinhKien> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
        _imageMeta,
        image.isAcceptableOrUnknown(data['image']!, _imageMeta),
      );
    }
    if (data.containsKey('soluong')) {
      context.handle(
        _soluongMeta,
        soluong.isAcceptableOrUnknown(data['soluong']!, _soluongMeta),
      );
    }
    if (data.containsKey('gia')) {
      context.handle(
        _giaMeta,
        gia.isAcceptableOrUnknown(data['gia']!, _giaMeta),
      );
    }
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LinhKien map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LinhKien(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      image: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image'],
      ),
      soluong: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}soluong'],
      )!,
      gia: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}gia'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      ),
    );
  }

  @override
  $LinhKiensTable createAlias(String alias) {
    return $LinhKiensTable(attachedDatabase, alias);
  }
}

class LinhKien extends DataClass implements Insertable<LinhKien> {
  final int id;
  final String name;
  final String? image;
  final int soluong;
  final double gia;
  final int? categoryId;
  const LinhKien({
    required this.id,
    required this.name,
    this.image,
    required this.soluong,
    required this.gia,
    this.categoryId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    map['soluong'] = Variable<int>(soluong);
    map['gia'] = Variable<double>(gia);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<int>(categoryId);
    }
    return map;
  }

  LinhKiensCompanion toCompanion(bool nullToAbsent) {
    return LinhKiensCompanion(
      id: Value(id),
      name: Value(name),
      image: image == null && nullToAbsent
          ? const Value.absent()
          : Value(image),
      soluong: Value(soluong),
      gia: Value(gia),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
    );
  }

  factory LinhKien.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LinhKien(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String?>(json['image']),
      soluong: serializer.fromJson<int>(json['soluong']),
      gia: serializer.fromJson<double>(json['gia']),
      categoryId: serializer.fromJson<int?>(json['categoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String?>(image),
      'soluong': serializer.toJson<int>(soluong),
      'gia': serializer.toJson<double>(gia),
      'categoryId': serializer.toJson<int?>(categoryId),
    };
  }

  LinhKien copyWith({
    int? id,
    String? name,
    Value<String?> image = const Value.absent(),
    int? soluong,
    double? gia,
    Value<int?> categoryId = const Value.absent(),
  }) => LinhKien(
    id: id ?? this.id,
    name: name ?? this.name,
    image: image.present ? image.value : this.image,
    soluong: soluong ?? this.soluong,
    gia: gia ?? this.gia,
    categoryId: categoryId.present ? categoryId.value : this.categoryId,
  );
  LinhKien copyWithCompanion(LinhKiensCompanion data) {
    return LinhKien(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      image: data.image.present ? data.image.value : this.image,
      soluong: data.soluong.present ? data.soluong.value : this.soluong,
      gia: data.gia.present ? data.gia.value : this.gia,
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LinhKien(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('soluong: $soluong, ')
          ..write('gia: $gia, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image, soluong, gia, categoryId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LinhKien &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.soluong == this.soluong &&
          other.gia == this.gia &&
          other.categoryId == this.categoryId);
}

class LinhKiensCompanion extends UpdateCompanion<LinhKien> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> image;
  final Value<int> soluong;
  final Value<double> gia;
  final Value<int?> categoryId;
  const LinhKiensCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.soluong = const Value.absent(),
    this.gia = const Value.absent(),
    this.categoryId = const Value.absent(),
  });
  LinhKiensCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.image = const Value.absent(),
    this.soluong = const Value.absent(),
    this.gia = const Value.absent(),
    this.categoryId = const Value.absent(),
  }) : name = Value(name);
  static Insertable<LinhKien> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? image,
    Expression<int>? soluong,
    Expression<double>? gia,
    Expression<int>? categoryId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (soluong != null) 'soluong': soluong,
      if (gia != null) 'gia': gia,
      if (categoryId != null) 'category_id': categoryId,
    });
  }

  LinhKiensCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String?>? image,
    Value<int>? soluong,
    Value<double>? gia,
    Value<int?>? categoryId,
  }) {
    return LinhKiensCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      soluong: soluong ?? this.soluong,
      gia: gia ?? this.gia,
      categoryId: categoryId ?? this.categoryId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (soluong.present) {
      map['soluong'] = Variable<int>(soluong.value);
    }
    if (gia.present) {
      map['gia'] = Variable<double>(gia.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinhKiensCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('soluong: $soluong, ')
          ..write('gia: $gia, ')
          ..write('categoryId: $categoryId')
          ..write(')'))
        .toString();
  }
}

abstract class _$LinhKienDatabase extends GeneratedDatabase {
  _$LinhKienDatabase(QueryExecutor e) : super(e);
  $LinhKienDatabaseManager get managers => $LinhKienDatabaseManager(this);
  late final $LoaiLinhKiensTable loaiLinhKiens = $LoaiLinhKiensTable(this);
  late final $LinhKiensTable linhKiens = $LinhKiensTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    loaiLinhKiens,
    linhKiens,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'loai_linh_kiens',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('linh_kiens', kind: UpdateKind.update)],
    ),
  ]);
}

typedef $$LoaiLinhKiensTableCreateCompanionBuilder =
    LoaiLinhKiensCompanion Function({Value<int> id, required String name});
typedef $$LoaiLinhKiensTableUpdateCompanionBuilder =
    LoaiLinhKiensCompanion Function({Value<int> id, Value<String> name});

final class $$LoaiLinhKiensTableReferences
    extends
        BaseReferences<_$LinhKienDatabase, $LoaiLinhKiensTable, LoaiLinhKien> {
  $$LoaiLinhKiensTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$LinhKiensTable, List<LinhKien>>
  _linhKiensRefsTable(_$LinhKienDatabase db) => MultiTypedResultKey.fromTable(
    db.linhKiens,
    aliasName: $_aliasNameGenerator(
      db.loaiLinhKiens.id,
      db.linhKiens.categoryId,
    ),
  );

  $$LinhKiensTableProcessedTableManager get linhKiensRefs {
    final manager = $$LinhKiensTableTableManager(
      $_db,
      $_db.linhKiens,
    ).filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_linhKiensRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LoaiLinhKiensTableFilterComposer
    extends Composer<_$LinhKienDatabase, $LoaiLinhKiensTable> {
  $$LoaiLinhKiensTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> linhKiensRefs(
    Expression<bool> Function($$LinhKiensTableFilterComposer f) f,
  ) {
    final $$LinhKiensTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.linhKiens,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinhKiensTableFilterComposer(
            $db: $db,
            $table: $db.linhKiens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LoaiLinhKiensTableOrderingComposer
    extends Composer<_$LinhKienDatabase, $LoaiLinhKiensTable> {
  $$LoaiLinhKiensTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LoaiLinhKiensTableAnnotationComposer
    extends Composer<_$LinhKienDatabase, $LoaiLinhKiensTable> {
  $$LoaiLinhKiensTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> linhKiensRefs<T extends Object>(
    Expression<T> Function($$LinhKiensTableAnnotationComposer a) f,
  ) {
    final $$LinhKiensTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.linhKiens,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LinhKiensTableAnnotationComposer(
            $db: $db,
            $table: $db.linhKiens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LoaiLinhKiensTableTableManager
    extends
        RootTableManager<
          _$LinhKienDatabase,
          $LoaiLinhKiensTable,
          LoaiLinhKien,
          $$LoaiLinhKiensTableFilterComposer,
          $$LoaiLinhKiensTableOrderingComposer,
          $$LoaiLinhKiensTableAnnotationComposer,
          $$LoaiLinhKiensTableCreateCompanionBuilder,
          $$LoaiLinhKiensTableUpdateCompanionBuilder,
          (LoaiLinhKien, $$LoaiLinhKiensTableReferences),
          LoaiLinhKien,
          PrefetchHooks Function({bool linhKiensRefs})
        > {
  $$LoaiLinhKiensTableTableManager(
    _$LinhKienDatabase db,
    $LoaiLinhKiensTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LoaiLinhKiensTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LoaiLinhKiensTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LoaiLinhKiensTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => LoaiLinhKiensCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  LoaiLinhKiensCompanion.insert(id: id, name: name),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LoaiLinhKiensTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({linhKiensRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (linhKiensRefs) db.linhKiens],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (linhKiensRefs)
                    await $_getPrefetchedData<
                      LoaiLinhKien,
                      $LoaiLinhKiensTable,
                      LinhKien
                    >(
                      currentTable: table,
                      referencedTable: $$LoaiLinhKiensTableReferences
                          ._linhKiensRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$LoaiLinhKiensTableReferences(
                            db,
                            table,
                            p0,
                          ).linhKiensRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.categoryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LoaiLinhKiensTableProcessedTableManager =
    ProcessedTableManager<
      _$LinhKienDatabase,
      $LoaiLinhKiensTable,
      LoaiLinhKien,
      $$LoaiLinhKiensTableFilterComposer,
      $$LoaiLinhKiensTableOrderingComposer,
      $$LoaiLinhKiensTableAnnotationComposer,
      $$LoaiLinhKiensTableCreateCompanionBuilder,
      $$LoaiLinhKiensTableUpdateCompanionBuilder,
      (LoaiLinhKien, $$LoaiLinhKiensTableReferences),
      LoaiLinhKien,
      PrefetchHooks Function({bool linhKiensRefs})
    >;
typedef $$LinhKiensTableCreateCompanionBuilder =
    LinhKiensCompanion Function({
      Value<int> id,
      required String name,
      Value<String?> image,
      Value<int> soluong,
      Value<double> gia,
      Value<int?> categoryId,
    });
typedef $$LinhKiensTableUpdateCompanionBuilder =
    LinhKiensCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String?> image,
      Value<int> soluong,
      Value<double> gia,
      Value<int?> categoryId,
    });

final class $$LinhKiensTableReferences
    extends BaseReferences<_$LinhKienDatabase, $LinhKiensTable, LinhKien> {
  $$LinhKiensTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LoaiLinhKiensTable _categoryIdTable(_$LinhKienDatabase db) =>
      db.loaiLinhKiens.createAlias(
        $_aliasNameGenerator(db.linhKiens.categoryId, db.loaiLinhKiens.id),
      );

  $$LoaiLinhKiensTableProcessedTableManager? get categoryId {
    final $_column = $_itemColumn<int>('category_id');
    if ($_column == null) return null;
    final manager = $$LoaiLinhKiensTableTableManager(
      $_db,
      $_db.loaiLinhKiens,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LinhKiensTableFilterComposer
    extends Composer<_$LinhKienDatabase, $LinhKiensTable> {
  $$LinhKiensTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get soluong => $composableBuilder(
    column: $table.soluong,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get gia => $composableBuilder(
    column: $table.gia,
    builder: (column) => ColumnFilters(column),
  );

  $$LoaiLinhKiensTableFilterComposer get categoryId {
    final $$LoaiLinhKiensTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.loaiLinhKiens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoaiLinhKiensTableFilterComposer(
            $db: $db,
            $table: $db.loaiLinhKiens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LinhKiensTableOrderingComposer
    extends Composer<_$LinhKienDatabase, $LinhKiensTable> {
  $$LinhKiensTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get image => $composableBuilder(
    column: $table.image,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get soluong => $composableBuilder(
    column: $table.soluong,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get gia => $composableBuilder(
    column: $table.gia,
    builder: (column) => ColumnOrderings(column),
  );

  $$LoaiLinhKiensTableOrderingComposer get categoryId {
    final $$LoaiLinhKiensTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.loaiLinhKiens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoaiLinhKiensTableOrderingComposer(
            $db: $db,
            $table: $db.loaiLinhKiens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LinhKiensTableAnnotationComposer
    extends Composer<_$LinhKienDatabase, $LinhKiensTable> {
  $$LinhKiensTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<int> get soluong =>
      $composableBuilder(column: $table.soluong, builder: (column) => column);

  GeneratedColumn<double> get gia =>
      $composableBuilder(column: $table.gia, builder: (column) => column);

  $$LoaiLinhKiensTableAnnotationComposer get categoryId {
    final $$LoaiLinhKiensTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.loaiLinhKiens,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LoaiLinhKiensTableAnnotationComposer(
            $db: $db,
            $table: $db.loaiLinhKiens,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LinhKiensTableTableManager
    extends
        RootTableManager<
          _$LinhKienDatabase,
          $LinhKiensTable,
          LinhKien,
          $$LinhKiensTableFilterComposer,
          $$LinhKiensTableOrderingComposer,
          $$LinhKiensTableAnnotationComposer,
          $$LinhKiensTableCreateCompanionBuilder,
          $$LinhKiensTableUpdateCompanionBuilder,
          (LinhKien, $$LinhKiensTableReferences),
          LinhKien,
          PrefetchHooks Function({bool categoryId})
        > {
  $$LinhKiensTableTableManager(_$LinhKienDatabase db, $LinhKiensTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LinhKiensTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LinhKiensTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LinhKiensTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> image = const Value.absent(),
                Value<int> soluong = const Value.absent(),
                Value<double> gia = const Value.absent(),
                Value<int?> categoryId = const Value.absent(),
              }) => LinhKiensCompanion(
                id: id,
                name: name,
                image: image,
                soluong: soluong,
                gia: gia,
                categoryId: categoryId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> image = const Value.absent(),
                Value<int> soluong = const Value.absent(),
                Value<double> gia = const Value.absent(),
                Value<int?> categoryId = const Value.absent(),
              }) => LinhKiensCompanion.insert(
                id: id,
                name: name,
                image: image,
                soluong: soluong,
                gia: gia,
                categoryId: categoryId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LinhKiensTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (categoryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.categoryId,
                                referencedTable: $$LinhKiensTableReferences
                                    ._categoryIdTable(db),
                                referencedColumn: $$LinhKiensTableReferences
                                    ._categoryIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LinhKiensTableProcessedTableManager =
    ProcessedTableManager<
      _$LinhKienDatabase,
      $LinhKiensTable,
      LinhKien,
      $$LinhKiensTableFilterComposer,
      $$LinhKiensTableOrderingComposer,
      $$LinhKiensTableAnnotationComposer,
      $$LinhKiensTableCreateCompanionBuilder,
      $$LinhKiensTableUpdateCompanionBuilder,
      (LinhKien, $$LinhKiensTableReferences),
      LinhKien,
      PrefetchHooks Function({bool categoryId})
    >;

class $LinhKienDatabaseManager {
  final _$LinhKienDatabase _db;
  $LinhKienDatabaseManager(this._db);
  $$LoaiLinhKiensTableTableManager get loaiLinhKiens =>
      $$LoaiLinhKiensTableTableManager(_db, _db.loaiLinhKiens);
  $$LinhKiensTableTableManager get linhKiens =>
      $$LinhKiensTableTableManager(_db, _db.linhKiens);
}
