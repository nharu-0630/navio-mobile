import 'package:drift/drift.dart';
import 'package:navio_mobile/database/circle.dart';
import 'package:navio_mobile/database/database.dart';

part 'circle_dao.g.dart';

@DriftAccessor(tables: [Circles])
class CircleDao extends DatabaseAccessor<Database> with _$CircleDaoMixin {
  CircleDao(Database db) : super(db);

  Future<List<Circle>> getAllCircles() => select(circles).get();
  Stream<List<Circle>> watchAllCircles() => select(circles).watch();
  Future insertCircle(Insertable<Circle> circle) =>
      into(circles).insert(circle);
  Future updateCircle(Insertable<Circle> circle) =>
      update(circles).replace(circle);
  Future deleteCircle(Insertable<Circle> circle) =>
      delete(circles).delete(circle);
}
