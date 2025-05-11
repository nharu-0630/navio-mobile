import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class CircleInfos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get circleID => text()();
  TextColumn get space => text()();
  TextColumn get artifactTitle => text()();
  TextColumn get artifactTendency => text()();
  TextColumn get nameKana => text()();
  TextColumn get name => text()();
  TextColumn get penName => text().withDefault(const Constant(''))();
  BoolColumn get isManga => boolean()();
  BoolColumn get isNovel => boolean()();
  BoolColumn get isR18 => boolean()();
  TextColumn get homepageURL => text().withDefault(const Constant(''))();
  TextColumn get twitterURL => text().withDefault(const Constant(''))();
  TextColumn get pixivURL => text().withDefault(const Constant(''))();
  TextColumn get imageURL => text().withDefault(const Constant(''))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [CircleInfos])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<CircleInfo>> getAllCircles() => select(circleInfos).get();

  Future<int> insertCircle(CircleInfosCompanion item) =>
      into(circleInfos).insert(item);

  Future<bool> updateCircle(CircleInfo item) =>
      update(circleInfos).replace(item);

  Future<int> deleteCircle(CircleInfo item) => delete(circleInfos).delete(item);

  Future<int> deleteAllCircles() => delete(circleInfos).go();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'circle_infos.sqlite'));
    return NativeDatabase(file);
  });
}
