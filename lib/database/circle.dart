import 'package:drift/drift.dart';
import 'package:navio_mobile/database/building.dart';

class Circles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get block => text()();
  IntColumn get number => integer()();
  TextColumn get suffix => text()();

  IntColumn get buildingId => integer().nullable().references(Buildings, #id)();
}
