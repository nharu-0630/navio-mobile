// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'circle_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CircleInfo {

 String get circleID; String get space; String get artifactTitle; String get artifactTendency; String get nameKana; String get name; String get penName; bool get isManga; bool get isNovel; bool get isR18; String get homepageURL; String get twitterURL; String get pixivURL; String get imageURL;
/// Create a copy of CircleInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CircleInfoCopyWith<CircleInfo> get copyWith => _$CircleInfoCopyWithImpl<CircleInfo>(this as CircleInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CircleInfo&&(identical(other.circleID, circleID) || other.circleID == circleID)&&(identical(other.space, space) || other.space == space)&&(identical(other.artifactTitle, artifactTitle) || other.artifactTitle == artifactTitle)&&(identical(other.artifactTendency, artifactTendency) || other.artifactTendency == artifactTendency)&&(identical(other.nameKana, nameKana) || other.nameKana == nameKana)&&(identical(other.name, name) || other.name == name)&&(identical(other.penName, penName) || other.penName == penName)&&(identical(other.isManga, isManga) || other.isManga == isManga)&&(identical(other.isNovel, isNovel) || other.isNovel == isNovel)&&(identical(other.isR18, isR18) || other.isR18 == isR18)&&(identical(other.homepageURL, homepageURL) || other.homepageURL == homepageURL)&&(identical(other.twitterURL, twitterURL) || other.twitterURL == twitterURL)&&(identical(other.pixivURL, pixivURL) || other.pixivURL == pixivURL)&&(identical(other.imageURL, imageURL) || other.imageURL == imageURL));
}


@override
int get hashCode => Object.hash(runtimeType,circleID,space,artifactTitle,artifactTendency,nameKana,name,penName,isManga,isNovel,isR18,homepageURL,twitterURL,pixivURL,imageURL);

@override
String toString() {
  return 'CircleInfo(circleID: $circleID, space: $space, artifactTitle: $artifactTitle, artifactTendency: $artifactTendency, nameKana: $nameKana, name: $name, penName: $penName, isManga: $isManga, isNovel: $isNovel, isR18: $isR18, homepageURL: $homepageURL, twitterURL: $twitterURL, pixivURL: $pixivURL, imageURL: $imageURL)';
}


}

/// @nodoc
abstract mixin class $CircleInfoCopyWith<$Res>  {
  factory $CircleInfoCopyWith(CircleInfo value, $Res Function(CircleInfo) _then) = _$CircleInfoCopyWithImpl;
@useResult
$Res call({
 String circleID, String space, String artifactTitle, String artifactTendency, String nameKana, String name, String penName, bool isManga, bool isNovel, bool isR18, String homepageURL, String twitterURL, String pixivURL, String imageURL
});




}
/// @nodoc
class _$CircleInfoCopyWithImpl<$Res>
    implements $CircleInfoCopyWith<$Res> {
  _$CircleInfoCopyWithImpl(this._self, this._then);

  final CircleInfo _self;
  final $Res Function(CircleInfo) _then;

/// Create a copy of CircleInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? circleID = null,Object? space = null,Object? artifactTitle = null,Object? artifactTendency = null,Object? nameKana = null,Object? name = null,Object? penName = null,Object? isManga = null,Object? isNovel = null,Object? isR18 = null,Object? homepageURL = null,Object? twitterURL = null,Object? pixivURL = null,Object? imageURL = null,}) {
  return _then(_self.copyWith(
circleID: null == circleID ? _self.circleID : circleID // ignore: cast_nullable_to_non_nullable
as String,space: null == space ? _self.space : space // ignore: cast_nullable_to_non_nullable
as String,artifactTitle: null == artifactTitle ? _self.artifactTitle : artifactTitle // ignore: cast_nullable_to_non_nullable
as String,artifactTendency: null == artifactTendency ? _self.artifactTendency : artifactTendency // ignore: cast_nullable_to_non_nullable
as String,nameKana: null == nameKana ? _self.nameKana : nameKana // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,penName: null == penName ? _self.penName : penName // ignore: cast_nullable_to_non_nullable
as String,isManga: null == isManga ? _self.isManga : isManga // ignore: cast_nullable_to_non_nullable
as bool,isNovel: null == isNovel ? _self.isNovel : isNovel // ignore: cast_nullable_to_non_nullable
as bool,isR18: null == isR18 ? _self.isR18 : isR18 // ignore: cast_nullable_to_non_nullable
as bool,homepageURL: null == homepageURL ? _self.homepageURL : homepageURL // ignore: cast_nullable_to_non_nullable
as String,twitterURL: null == twitterURL ? _self.twitterURL : twitterURL // ignore: cast_nullable_to_non_nullable
as String,pixivURL: null == pixivURL ? _self.pixivURL : pixivURL // ignore: cast_nullable_to_non_nullable
as String,imageURL: null == imageURL ? _self.imageURL : imageURL // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _CircleInfo implements CircleInfo {
  const _CircleInfo({required this.circleID, required this.space, required this.artifactTitle, required this.artifactTendency, required this.nameKana, required this.name, this.penName = '', required this.isManga, required this.isNovel, required this.isR18, this.homepageURL = '', this.twitterURL = '', this.pixivURL = '', this.imageURL = ''});
  

@override final  String circleID;
@override final  String space;
@override final  String artifactTitle;
@override final  String artifactTendency;
@override final  String nameKana;
@override final  String name;
@override@JsonKey() final  String penName;
@override final  bool isManga;
@override final  bool isNovel;
@override final  bool isR18;
@override@JsonKey() final  String homepageURL;
@override@JsonKey() final  String twitterURL;
@override@JsonKey() final  String pixivURL;
@override@JsonKey() final  String imageURL;

/// Create a copy of CircleInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CircleInfoCopyWith<_CircleInfo> get copyWith => __$CircleInfoCopyWithImpl<_CircleInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CircleInfo&&(identical(other.circleID, circleID) || other.circleID == circleID)&&(identical(other.space, space) || other.space == space)&&(identical(other.artifactTitle, artifactTitle) || other.artifactTitle == artifactTitle)&&(identical(other.artifactTendency, artifactTendency) || other.artifactTendency == artifactTendency)&&(identical(other.nameKana, nameKana) || other.nameKana == nameKana)&&(identical(other.name, name) || other.name == name)&&(identical(other.penName, penName) || other.penName == penName)&&(identical(other.isManga, isManga) || other.isManga == isManga)&&(identical(other.isNovel, isNovel) || other.isNovel == isNovel)&&(identical(other.isR18, isR18) || other.isR18 == isR18)&&(identical(other.homepageURL, homepageURL) || other.homepageURL == homepageURL)&&(identical(other.twitterURL, twitterURL) || other.twitterURL == twitterURL)&&(identical(other.pixivURL, pixivURL) || other.pixivURL == pixivURL)&&(identical(other.imageURL, imageURL) || other.imageURL == imageURL));
}


@override
int get hashCode => Object.hash(runtimeType,circleID,space,artifactTitle,artifactTendency,nameKana,name,penName,isManga,isNovel,isR18,homepageURL,twitterURL,pixivURL,imageURL);

@override
String toString() {
  return 'CircleInfo(circleID: $circleID, space: $space, artifactTitle: $artifactTitle, artifactTendency: $artifactTendency, nameKana: $nameKana, name: $name, penName: $penName, isManga: $isManga, isNovel: $isNovel, isR18: $isR18, homepageURL: $homepageURL, twitterURL: $twitterURL, pixivURL: $pixivURL, imageURL: $imageURL)';
}


}

/// @nodoc
abstract mixin class _$CircleInfoCopyWith<$Res> implements $CircleInfoCopyWith<$Res> {
  factory _$CircleInfoCopyWith(_CircleInfo value, $Res Function(_CircleInfo) _then) = __$CircleInfoCopyWithImpl;
@override @useResult
$Res call({
 String circleID, String space, String artifactTitle, String artifactTendency, String nameKana, String name, String penName, bool isManga, bool isNovel, bool isR18, String homepageURL, String twitterURL, String pixivURL, String imageURL
});




}
/// @nodoc
class __$CircleInfoCopyWithImpl<$Res>
    implements _$CircleInfoCopyWith<$Res> {
  __$CircleInfoCopyWithImpl(this._self, this._then);

  final _CircleInfo _self;
  final $Res Function(_CircleInfo) _then;

/// Create a copy of CircleInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? circleID = null,Object? space = null,Object? artifactTitle = null,Object? artifactTendency = null,Object? nameKana = null,Object? name = null,Object? penName = null,Object? isManga = null,Object? isNovel = null,Object? isR18 = null,Object? homepageURL = null,Object? twitterURL = null,Object? pixivURL = null,Object? imageURL = null,}) {
  return _then(_CircleInfo(
circleID: null == circleID ? _self.circleID : circleID // ignore: cast_nullable_to_non_nullable
as String,space: null == space ? _self.space : space // ignore: cast_nullable_to_non_nullable
as String,artifactTitle: null == artifactTitle ? _self.artifactTitle : artifactTitle // ignore: cast_nullable_to_non_nullable
as String,artifactTendency: null == artifactTendency ? _self.artifactTendency : artifactTendency // ignore: cast_nullable_to_non_nullable
as String,nameKana: null == nameKana ? _self.nameKana : nameKana // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,penName: null == penName ? _self.penName : penName // ignore: cast_nullable_to_non_nullable
as String,isManga: null == isManga ? _self.isManga : isManga // ignore: cast_nullable_to_non_nullable
as bool,isNovel: null == isNovel ? _self.isNovel : isNovel // ignore: cast_nullable_to_non_nullable
as bool,isR18: null == isR18 ? _self.isR18 : isR18 // ignore: cast_nullable_to_non_nullable
as bool,homepageURL: null == homepageURL ? _self.homepageURL : homepageURL // ignore: cast_nullable_to_non_nullable
as String,twitterURL: null == twitterURL ? _self.twitterURL : twitterURL // ignore: cast_nullable_to_non_nullable
as String,pixivURL: null == pixivURL ? _self.pixivURL : pixivURL // ignore: cast_nullable_to_non_nullable
as String,imageURL: null == imageURL ? _self.imageURL : imageURL // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
