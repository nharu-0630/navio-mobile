import 'package:drift/drift.dart';

import '../database/database.dart';
import '../services/api_service.dart';

class ApiRepository {
  final AppDatabase _database;
  final ApiService _apiService;

  ApiRepository(this._database, this._apiService);

  Future<List<CircleInfo>> fetchCircles() async {
    try {
      final circles = await _apiService.fetchCircles();
      await _database.deleteAllCircles();

      for (var item in circles) {
        await _database.insertCircle(
          CircleInfosCompanion.insert(
            circleID: item.circleID,
            space: item.space,
            artifactTitle: item.artifactTitle,
            artifactTendency: item.artifactTendency,
            nameKana: item.nameKana,
            name: item.name,
            penName: Value(item.penName),
            isManga: item.isManga,
            isNovel: item.isNovel,
            isR18: item.isR18,
            homepageURL: Value(item.homepageURL),
            twitterURL: Value(item.twitterURL),
            pixivURL: Value(item.pixivURL),
            imageURL: Value(item.imageURL),
          ),
        );
      }
      return await _database.getAllCircles();
    } catch (e) {
      throw Exception('Failed to fetch and save data: $e');
    }
  }

  // DBからすべてのデータを取得
  Future<List<CircleInfo>> getAllCircles() async {
    return await _database.getAllCircles();
  }
}
