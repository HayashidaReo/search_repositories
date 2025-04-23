// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => _ApiResponse(
  name: json['name'] as String,
  description: json['description'] as String?,
  language: json['language'] as String?,
  stargazersCount: (json['stargazers_count'] as num).toInt(),
  watchersCount: (json['watchers_count'] as num).toInt(),
  forksCount: (json['forks_count'] as num).toInt(),
  openIssuesCount: (json['open_issues_count'] as num).toInt(),
  htmlUrl: json['html_url'] as String,
  owner: ApiOwnerResponse.fromJson(json['owner'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ApiResponseToJson(_ApiResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'stargazers_count': instance.stargazersCount,
      'watchers_count': instance.watchersCount,
      'forks_count': instance.forksCount,
      'open_issues_count': instance.openIssuesCount,
      'html_url': instance.htmlUrl,
      'owner': instance.owner.toJson(),
    };
