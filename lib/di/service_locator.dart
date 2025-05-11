import 'package:get_it/get_it.dart';

import '../database/database.dart';
import '../repositories/api_repository.dart';
import '../services/api_service.dart';
import '../viewmodels/api_data_viewmodel.dart';
import '../viewmodels/settings_viewmodel.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // データベース
  locator.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // サービス
  locator.registerLazySingleton<ApiService>(() => ApiService());

  // リポジトリ
  locator.registerLazySingleton<ApiRepository>(
    () => ApiRepository(locator<AppDatabase>(), locator<ApiService>()),
  );

  // ViewModel
  locator.registerFactory<ApiDataViewModel>(
    () => ApiDataViewModel(locator<ApiRepository>(), locator<ApiService>()),
  );

  locator.registerFactory<SettingsViewModel>(() => SettingsViewModel());
}
