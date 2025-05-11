import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:navio_mobile/database/building.dart';
import 'package:navio_mobile/database/building_dao.dart';
import 'package:navio_mobile/database/category.dart';
import 'package:navio_mobile/database/category_dao.dart';
import 'package:navio_mobile/database/circle.dart';
import 'package:navio_mobile/database/circle_dao.dart';
import 'package:navio_mobile/database/todo.dart';
import 'package:navio_mobile/database/todo_dao.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [Buildings, Todos, Categories, Circles],
  daos: [BuildingDao, TodoDao, CategoryDao, CircleDao],
)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) async {
      await m.createAll();
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
