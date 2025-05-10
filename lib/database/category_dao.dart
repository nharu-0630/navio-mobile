import 'package:drift/drift.dart';
import 'package:navio_mobile/database/category.dart';
import 'package:navio_mobile/database/database.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [Categories])
class CategoryDao extends DatabaseAccessor<Database> with _$CategoryDaoMixin {
  CategoryDao(Database db) : super(db);

  Future<List<Category>> getAllCategories() => select(categories).get();
  Stream<List<Category>> watchAllCategories() => select(categories).watch();
  Future insertCategory(Insertable<Category> category) =>
      into(categories).insert(category);
  Future updateCategory(Insertable<Category> category) =>
      update(categories).replace(category);
  Future deleteCategory(Insertable<Category> category) =>
      delete(categories).delete(category);
}
