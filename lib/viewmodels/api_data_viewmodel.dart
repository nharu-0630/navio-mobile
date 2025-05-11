import 'package:flutter/foundation.dart';

import '../database/database.dart';
import '../models/api_settings.dart';
import '../repositories/api_repository.dart';
import '../services/api_service.dart';

class ApiDataViewModel extends ChangeNotifier {
  final ApiRepository _repository;
  final ApiService _apiService;

  List<CircleInfo> _items = [];
  bool _isLoading = false;
  String _errorMessage = '';
  ApiSettings _settings = const ApiSettings(cookieValue: '');

  ApiDataViewModel(this._repository, this._apiService);

  List<CircleInfo> get items => _items;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  ApiSettings get settings => _settings;

  void updateSettings(ApiSettings settings) {
    _settings = settings;
    _apiService.updateSettings(settings);
    notifyListeners();
  }

  Future<void> fetchData() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _items = await _repository.fetchCircles();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadLocalData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _items = await _repository.getAllCircles();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
