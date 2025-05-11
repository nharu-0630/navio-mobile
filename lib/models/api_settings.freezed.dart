// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiSettings {

 String get cookieValue; String get apiUrl;
/// Create a copy of ApiSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiSettingsCopyWith<ApiSettings> get copyWith => _$ApiSettingsCopyWithImpl<ApiSettings>(this as ApiSettings, _$identity);

  /// Serializes this ApiSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiSettings&&(identical(other.cookieValue, cookieValue) || other.cookieValue == cookieValue)&&(identical(other.apiUrl, apiUrl) || other.apiUrl == apiUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cookieValue,apiUrl);

@override
String toString() {
  return 'ApiSettings(cookieValue: $cookieValue, apiUrl: $apiUrl)';
}


}

/// @nodoc
abstract mixin class $ApiSettingsCopyWith<$Res>  {
  factory $ApiSettingsCopyWith(ApiSettings value, $Res Function(ApiSettings) _then) = _$ApiSettingsCopyWithImpl;
@useResult
$Res call({
 String cookieValue, String apiUrl
});




}
/// @nodoc
class _$ApiSettingsCopyWithImpl<$Res>
    implements $ApiSettingsCopyWith<$Res> {
  _$ApiSettingsCopyWithImpl(this._self, this._then);

  final ApiSettings _self;
  final $Res Function(ApiSettings) _then;

/// Create a copy of ApiSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cookieValue = null,Object? apiUrl = null,}) {
  return _then(_self.copyWith(
cookieValue: null == cookieValue ? _self.cookieValue : cookieValue // ignore: cast_nullable_to_non_nullable
as String,apiUrl: null == apiUrl ? _self.apiUrl : apiUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ApiSettings implements ApiSettings {
  const _ApiSettings({required this.cookieValue, this.apiUrl = ''});
  factory _ApiSettings.fromJson(Map<String, dynamic> json) => _$ApiSettingsFromJson(json);

@override final  String cookieValue;
@override@JsonKey() final  String apiUrl;

/// Create a copy of ApiSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiSettingsCopyWith<_ApiSettings> get copyWith => __$ApiSettingsCopyWithImpl<_ApiSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiSettings&&(identical(other.cookieValue, cookieValue) || other.cookieValue == cookieValue)&&(identical(other.apiUrl, apiUrl) || other.apiUrl == apiUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cookieValue,apiUrl);

@override
String toString() {
  return 'ApiSettings(cookieValue: $cookieValue, apiUrl: $apiUrl)';
}


}

/// @nodoc
abstract mixin class _$ApiSettingsCopyWith<$Res> implements $ApiSettingsCopyWith<$Res> {
  factory _$ApiSettingsCopyWith(_ApiSettings value, $Res Function(_ApiSettings) _then) = __$ApiSettingsCopyWithImpl;
@override @useResult
$Res call({
 String cookieValue, String apiUrl
});




}
/// @nodoc
class __$ApiSettingsCopyWithImpl<$Res>
    implements _$ApiSettingsCopyWith<$Res> {
  __$ApiSettingsCopyWithImpl(this._self, this._then);

  final _ApiSettings _self;
  final $Res Function(_ApiSettings) _then;

/// Create a copy of ApiSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cookieValue = null,Object? apiUrl = null,}) {
  return _then(_ApiSettings(
cookieValue: null == cookieValue ? _self.cookieValue : cookieValue // ignore: cast_nullable_to_non_nullable
as String,apiUrl: null == apiUrl ? _self.apiUrl : apiUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
