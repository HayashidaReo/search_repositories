// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_owner_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ApiOwnerResponse {

 String get avatarUrl; String get login;
/// Create a copy of ApiOwnerResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiOwnerResponseCopyWith<ApiOwnerResponse> get copyWith => _$ApiOwnerResponseCopyWithImpl<ApiOwnerResponse>(this as ApiOwnerResponse, _$identity);

  /// Serializes this ApiOwnerResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiOwnerResponse&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.login, login) || other.login == login));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avatarUrl,login);

@override
String toString() {
  return 'ApiOwnerResponse(avatarUrl: $avatarUrl, login: $login)';
}


}

/// @nodoc
abstract mixin class $ApiOwnerResponseCopyWith<$Res>  {
  factory $ApiOwnerResponseCopyWith(ApiOwnerResponse value, $Res Function(ApiOwnerResponse) _then) = _$ApiOwnerResponseCopyWithImpl;
@useResult
$Res call({
 String avatarUrl, String login
});




}
/// @nodoc
class _$ApiOwnerResponseCopyWithImpl<$Res>
    implements $ApiOwnerResponseCopyWith<$Res> {
  _$ApiOwnerResponseCopyWithImpl(this._self, this._then);

  final ApiOwnerResponse _self;
  final $Res Function(ApiOwnerResponse) _then;

/// Create a copy of ApiOwnerResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? avatarUrl = null,Object? login = null,}) {
  return _then(_self.copyWith(
avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _ApiOwnerResponse implements ApiOwnerResponse {
   _ApiOwnerResponse({required this.avatarUrl, required this.login});
  factory _ApiOwnerResponse.fromJson(Map<String, dynamic> json) => _$ApiOwnerResponseFromJson(json);

@override final  String avatarUrl;
@override final  String login;

/// Create a copy of ApiOwnerResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiOwnerResponseCopyWith<_ApiOwnerResponse> get copyWith => __$ApiOwnerResponseCopyWithImpl<_ApiOwnerResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ApiOwnerResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiOwnerResponse&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.login, login) || other.login == login));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,avatarUrl,login);

@override
String toString() {
  return 'ApiOwnerResponse(avatarUrl: $avatarUrl, login: $login)';
}


}

/// @nodoc
abstract mixin class _$ApiOwnerResponseCopyWith<$Res> implements $ApiOwnerResponseCopyWith<$Res> {
  factory _$ApiOwnerResponseCopyWith(_ApiOwnerResponse value, $Res Function(_ApiOwnerResponse) _then) = __$ApiOwnerResponseCopyWithImpl;
@override @useResult
$Res call({
 String avatarUrl, String login
});




}
/// @nodoc
class __$ApiOwnerResponseCopyWithImpl<$Res>
    implements _$ApiOwnerResponseCopyWith<$Res> {
  __$ApiOwnerResponseCopyWithImpl(this._self, this._then);

  final _ApiOwnerResponse _self;
  final $Res Function(_ApiOwnerResponse) _then;

/// Create a copy of ApiOwnerResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? avatarUrl = null,Object? login = null,}) {
  return _then(_ApiOwnerResponse(
avatarUrl: null == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,login: null == login ? _self.login : login // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
