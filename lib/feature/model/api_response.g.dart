// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => _ApiResponse(
  name: json['full_name'] as String,
  description: json['description'] as String?,
  language: json['language'] as String?,
  stars: (json['stargazers_count'] as num).toInt(),
  watchers: (json['watchers_count'] as num).toInt(),
  forks: (json['forks_count'] as num).toInt(),
  issues: (json['open_issues_count'] as num).toInt(),
  url: json['html_url'] as String,
  owner: ApiOwnerResponse.fromJson(json['owner'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApiResponseToJson(_ApiResponse instance) =>
    <String, dynamic>{
      'full_name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'stargazers_count': instance.stars,
      'watchers_count': instance.watchers,
      'forks_count': instance.forks,
      'open_issues_count': instance.issues,
      'html_url': instance.url,
      'owner': instance.owner,
    };
