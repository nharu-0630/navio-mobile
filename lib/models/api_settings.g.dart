// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiSettings _$ApiSettingsFromJson(Map<String, dynamic> json) => _ApiSettings(
  cookieValue: json['cookieValue'] as String,
  apiUrl: json['apiUrl'] as String? ?? '',
);

Map<String, dynamic> _$ApiSettingsToJson(_ApiSettings instance) =>
    <String, dynamic>{
      'cookieValue': instance.cookieValue,
      'apiUrl': instance.apiUrl,
    };
