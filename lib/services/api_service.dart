import 'package:dio/dio.dart';
import 'package:html/parser.dart';

import '../models/api_settings.dart';
import '../models/circle_info.dart';

class ApiService {
  final Dio _dio = Dio();
  ApiSettings _settings = const ApiSettings(cookieValue: '', apiUrl: '');

  void updateSettings(ApiSettings settings) {
    _settings = settings;
    _dio.options.headers['Cookie'] = settings.cookieValue;
  }

  Future<List<CircleInfo>> fetchCircles() async {
    try {
      if (_settings.apiUrl.isEmpty || _settings.cookieValue.isEmpty) {
        throw Exception('API URL or Cookie value is not set');
      }

      final response = await _dio.get(_settings.apiUrl);

      if (response.statusCode == 200) {
        final document = parse(response.data);
        final items = document.querySelectorAll("div.circle_list_item");
        return items
            .map((item) => CircleInfo.fromHTML(item.innerHtml))
            .toList();
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
