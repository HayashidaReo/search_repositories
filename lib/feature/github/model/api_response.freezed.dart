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
final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
); 

String get name => throw _privateConstructorUsedError; String? get description => throw _privateConstructorUsedError; String? get language => throw _privateConstructorUsedError;@JsonKey(name: 'stargazers_count') int get stars => throw _privateConstructorUsedError;@JsonKey(name: 'watchers_count') int get watchers => throw _privateConstructorUsedError;@JsonKey(name: 'forks_count') int get forks => throw _privateConstructorUsedError;@JsonKey(name: 'open_issues_count') int get issues => throw _privateConstructorUsedError;@JsonKey(name: 'html_url') String get url => throw _privateConstructorUsedError;@JsonKey(name: 'owner') ApiOwnerResponse get owner => throw _privateConstructorUsedError;
/// Create a copy of ApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiResponseCopyWith<ApiResponse> get copyWith => _$ApiResponseCopyWithImpl<ApiResponse>(this as ApiResponse, _$identity);

  /// Serializes this ApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.language, language) || other.language == language)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.watchers, watchers) || other.watchers == watchers)&&(identical(other.forks, forks) || other.forks == forks)&&(identical(other.issues, issues) || other.issues == issues)&&(identical(other.url, url) || other.url == url)&&(identical(other.owner, owner) || other.owner == owner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,language,stars,watchers,forks,issues,url,owner);

@override
String toString() {
  return 'ApiResponse(name: $name, description: $description, language: $language, stars: $stars, watchers: $watchers, forks: $forks, issues: $issues, url: $url, owner: $owner)';
}


}

/// @nodoc
abstract mixin class $ApiResponseCopyWith<$Res>  {
  factory $ApiResponseCopyWith(ApiResponse value, $Res Function(ApiResponse) _then) = _$ApiResponseCopyWithImpl;
@useResult
$Res call({
 String name, String? description, String? language,@JsonKey(name: 'stargazers_count') int stars,@JsonKey(name: 'watchers_count') int watchers,@JsonKey(name: 'forks_count') int forks,@JsonKey(name: 'open_issues_count') int issues,@JsonKey(name: 'html_url') String url,@JsonKey(name: 'owner') ApiOwnerResponse owner
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,Object? language = freezed,Object? stars = null,Object? watchers = null,Object? forks = null,Object? issues = null,Object? url = null,Object? owner = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,watchers: null == watchers ? _self.watchers : watchers // ignore: cast_nullable_to_non_nullable
as int,forks: null == forks ? _self.forks : forks // ignore: cast_nullable_to_non_nullable
as int,issues: null == issues ? _self.issues : issues // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()

class _ApiResponse implements ApiResponse {
   _ApiResponse({required this.name, this.description, this.language, @JsonKey(name: 'stargazers_count') required this.stars, @JsonKey(name: 'watchers_count') required this.watchers, @JsonKey(name: 'forks_count') required this.forks, @JsonKey(name: 'open_issues_count') required this.issues, @JsonKey(name: 'html_url') required this.url, @JsonKey(name: 'owner') required this.owner});
  factory _ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);

@override final  String name;
@override final  String? description;
@override final  String? language;
@override@JsonKey(name: 'stargazers_count') final  int stars;
@override@JsonKey(name: 'watchers_count') final  int watchers;
@override@JsonKey(name: 'forks_count') final  int forks;
@override@JsonKey(name: 'open_issues_count') final  int issues;
@override@JsonKey(name: 'html_url') final  String url;
@override@JsonKey(name: 'owner') final  ApiOwnerResponse owner;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiResponse&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.language, language) || other.language == language)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.watchers, watchers) || other.watchers == watchers)&&(identical(other.forks, forks) || other.forks == forks)&&(identical(other.issues, issues) || other.issues == issues)&&(identical(other.url, url) || other.url == url)&&(identical(other.owner, owner) || other.owner == owner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description,language,stars,watchers,forks,issues,url,owner);

@override
String toString() {
  return 'ApiResponse(name: $name, description: $description, language: $language, stars: $stars, watchers: $watchers, forks: $forks, issues: $issues, url: $url, owner: $owner)';
}

  @override
  UnsupportedError get _privateConstructorUsedError => throw UnimplementedError();


}

/// @nodoc
abstract mixin class _$ApiResponseCopyWith<$Res> implements $ApiResponseCopyWith<$Res> {
  factory _$ApiResponseCopyWith(_ApiResponse value, $Res Function(_ApiResponse) _then) = __$ApiResponseCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description, String? language,@JsonKey(name: 'stargazers_count') int stars,@JsonKey(name: 'watchers_count') int watchers,@JsonKey(name: 'forks_count') int forks,@JsonKey(name: 'open_issues_count') int issues,@JsonKey(name: 'html_url') String url,@JsonKey(name: 'owner') ApiOwnerResponse owner
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,Object? language = freezed,Object? stars = null,Object? watchers = null,Object? forks = null,Object? issues = null,Object? url = null,Object? owner = null,}) {
  return _then(_ApiResponse(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,watchers: null == watchers ? _self.watchers : watchers // ignore: cast_nullable_to_non_nullable
as int,forks: null == forks ? _self.forks : forks // ignore: cast_nullable_to_non_nullable
as int,issues: null == issues ? _self.issues : issues // ignore: cast_nullable_to_non_nullable
as int,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
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
