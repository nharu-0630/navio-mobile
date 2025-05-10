import 'package:drift/drift.dart';
import 'package:navio_mobile/database/category.dart';
import 'package:navio_mobile/database/circle.dart';

class Todos extends Table {
  IntColumn get id => integer().autoIncrement()();

  IntColumn get priority => integer().withDefault(const Constant(0))();
  TextColumn get title => text()();
  TextColumn get note => text().nullable()();
  IntColumn get quantity => integer().withDefault(const Constant(1))();
  IntColumn get price => integer().withDefault(const Constant(0))();

  BoolColumn get isDone => boolean().withDefault(const Constant(false))();
  IntColumn get categoryId =>
      integer().nullable().references(Categories, #id)();
  IntColumn get circleId => integer().nullable().references(Circles, #id)();

  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
