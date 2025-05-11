import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/api_settings.dart';

class SettingsViewModel extends ChangeNotifier {
  ApiSettings _settings = const ApiSettings(cookieValue: '', apiUrl: '');
  bool _isLoading = false;

  ApiSettings get settings => _settings;
  bool get isLoading => _isLoading;

  SettingsViewModel() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final settingsJson = prefs.getString('api_settings');

      if (settingsJson != null) {
        _settings = ApiSettings.fromJson(json.decode(settingsJson));
      }
    } catch (e) {
      print('Error loading settings: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveSettings(ApiSettings settings) async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('api_settings', json.encode(settings.toJson()));
      _settings = settings;
    } catch (e) {
      print('Error saving settings: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
