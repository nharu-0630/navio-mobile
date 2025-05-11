import 'package:drift/drift.dart';
import 'package:navio_mobile/database/building.dart';
import 'package:navio_mobile/database/database.dart';

part 'building_dao.g.dart';

@DriftAccessor(tables: [Buildings])
class BuildingDao extends DatabaseAccessor<Database> with _$BuildingDaoMixin {
  BuildingDao(Database db) : super(db);

  Future<List<Building>> getAllBuildings() => select(buildings).get();
  Stream<List<Building>> watchAllBuildings() => select(buildings).watch();
  Future insertBuilding(Insertable<Building> building) =>
      into(buildings).insert(building);
  Future updateBuilding(Insertable<Building> building) =>
      update(buildings).replace(building);
  Future deleteBuilding(Insertable<Building> building) =>
      delete(buildings).delete(building);
}
