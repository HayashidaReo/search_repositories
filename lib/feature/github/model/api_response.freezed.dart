// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiResponse {

 String get name; String? get description; String? get language; int get stargazersCount; int get watchersCount; int get forksCount; int get openIssuesCount; String get htmlUrl; ApiOwnerResponse get owner;
/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseCopyWith<ApiResponse> get copyWith => _$ApiResponseCopyWithImpl<ApiResponse>(this as ApiResponse, _$identity);

  /// Serializes this ApiResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.language, language) || other.language == language)&&(identical(other.stargazersCount, stargazersCount) || other.stargazersCount == stargazersCount)&&(identical(other.watchersCount, watchersCount) || other.watchersCount == watchersCount)&&(identical(other.forksCount, forksCount) || other.forksCount == forksCount)&&(identical(other.openIssuesCount, openIssuesCount) || other.openIssuesCount == openIssuesCount)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl)&&(identical(other.owner, owner) || other.owner == owner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,language,stargazersCount,watchersCount,forksCount,openIssuesCount,htmlUrl,owner);

@override
String toString() {
  return 'ApiResponse(name: $name, description: $description, language: $language, stargazersCount: $stargazersCount, watchersCount: $watchersCount, forksCount: $forksCount, openIssuesCount: $openIssuesCount, htmlUrl: $htmlUrl, owner: $owner)';
}


}

/// @nodoc
abstract mixin class $ApiResponseCopyWith<$Res>  {
  factory $ApiResponseCopyWith(ApiResponse value, $Res Function(ApiResponse) _then) = _$ApiResponseCopyWithImpl;
@useResult
$Res call({
 String name, String? description, String? language, int stargazersCount, int watchersCount, int forksCount, int openIssuesCount, String htmlUrl, ApiOwnerResponse owner
});


$ApiOwnerResponseCopyWith<$Res> get owner;

}
/// @nodoc
class _$ApiResponseCopyWithImpl<$Res>
    implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._self, this._then);

  final ApiResponse _self;
  final $Res Function(ApiResponse) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? language = freezed,Object? stargazersCount = null,Object? watchersCount = null,Object? forksCount = null,Object? openIssuesCount = null,Object? htmlUrl = null,Object? owner = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,stargazersCount: null == stargazersCount ? _self.stargazersCount : stargazersCount // ignore: cast_nullable_to_non_nullable
as int,watchersCount: null == watchersCount ? _self.watchersCount : watchersCount // ignore: cast_nullable_to_non_nullable
as int,forksCount: null == forksCount ? _self.forksCount : forksCount // ignore: cast_nullable_to_non_nullable
as int,openIssuesCount: null == openIssuesCount ? _self.openIssuesCount : openIssuesCount // ignore: cast_nullable_to_non_nullable
as int,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as ApiOwnerResponse,
  ));
}
/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiOwnerResponseCopyWith<$Res> get owner {
  
  return $ApiOwnerResponseCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _ApiResponse implements ApiResponse {
  const _ApiResponse({required this.name, this.description, this.language, required this.stargazersCount, required this.watchersCount, required this.forksCount, required this.openIssuesCount, required this.htmlUrl, required this.owner});
  factory _ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);

@override final  String name;
@override final  String? description;
@override final  String? language;
@override final  int stargazersCount;
@override final  int watchersCount;
@override final  int forksCount;
@override final  int openIssuesCount;
@override final  String htmlUrl;
@override final  ApiOwnerResponse owner;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiResponseCopyWith<_ApiResponse> get copyWith => __$ApiResponseCopyWithImpl<_ApiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.language, language) || other.language == language)&&(identical(other.stargazersCount, stargazersCount) || other.stargazersCount == stargazersCount)&&(identical(other.watchersCount, watchersCount) || other.watchersCount == watchersCount)&&(identical(other.forksCount, forksCount) || other.forksCount == forksCount)&&(identical(other.openIssuesCount, openIssuesCount) || other.openIssuesCount == openIssuesCount)&&(identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl)&&(identical(other.owner, owner) || other.owner == owner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,language,stargazersCount,watchersCount,forksCount,openIssuesCount,htmlUrl,owner);

@override
String toString() {
  return 'ApiResponse(name: $name, description: $description, language: $language, stargazersCount: $stargazersCount, watchersCount: $watchersCount, forksCount: $forksCount, openIssuesCount: $openIssuesCount, htmlUrl: $htmlUrl, owner: $owner)';
}


}

/// @nodoc
abstract mixin class _$ApiResponseCopyWith<$Res> implements $ApiResponseCopyWith<$Res> {
  factory _$ApiResponseCopyWith(_ApiResponse value, $Res Function(_ApiResponse) _then) = __$ApiResponseCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description, String? language, int stargazersCount, int watchersCount, int forksCount, int openIssuesCount, String htmlUrl, ApiOwnerResponse owner
});


@override $ApiOwnerResponseCopyWith<$Res> get owner;

}
/// @nodoc
class __$ApiResponseCopyWithImpl<$Res>
    implements _$ApiResponseCopyWith<$Res> {
  __$ApiResponseCopyWithImpl(this._self, this._then);

  final _ApiResponse _self;
  final $Res Function(_ApiResponse) _then;

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? language = freezed,Object? stargazersCount = null,Object? watchersCount = null,Object? forksCount = null,Object? openIssuesCount = null,Object? htmlUrl = null,Object? owner = null,}) {
  return _then(_ApiResponse(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,stargazersCount: null == stargazersCount ? _self.stargazersCount : stargazersCount // ignore: cast_nullable_to_non_nullable
as int,watchersCount: null == watchersCount ? _self.watchersCount : watchersCount // ignore: cast_nullable_to_non_nullable
as int,forksCount: null == forksCount ? _self.forksCount : forksCount // ignore: cast_nullable_to_non_nullable
as int,openIssuesCount: null == openIssuesCount ? _self.openIssuesCount : openIssuesCount // ignore: cast_nullable_to_non_nullable
as int,htmlUrl: null == htmlUrl ? _self.htmlUrl : htmlUrl // ignore: cast_nullable_to_non_nullable
as String,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as ApiOwnerResponse,
  ));
}

/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiOwnerResponseCopyWith<$Res> get owner {
  
  return $ApiOwnerResponseCopyWith<$Res>(_self.owner, (value) {
    return _then(_self.copyWith(owner: value));
  });
}
}

// dart format on
