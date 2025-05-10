import 'package:drift/drift.dart';

class Circles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get block => text()();
  IntColumn get number => integer()();
  TextColumn get suffix => text()();
}
