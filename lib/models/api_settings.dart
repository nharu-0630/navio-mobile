import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_settings.freezed.dart';
part 'api_settings.g.dart';

@freezed
abstract class ApiSettings with _$ApiSettings {
  const factory ApiSettings({
    required String cookieValue,
    @Default('') String apiUrl,
  }) = _ApiSettings;

  factory ApiSettings.fromJson(Map<String, dynamic> json) =>
      _$ApiSettingsFromJson(json);
}
