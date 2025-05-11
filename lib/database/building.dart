import 'package:drift/drift.dart';

class Buildings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BlobColumn get content => blob()();
}
