import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_repositories/feature/github/model/api_owner_response.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
class ApiResponse with _$ApiResponse {
  factory ApiResponse({
    required String name,
    String? description,
    String? language,
    @JsonKey(name: 'stargazers_count') required int stars,
    @JsonKey(name: 'watchers_count') required int watchers,
    @JsonKey(name: 'forks_count') required int forks,
    @JsonKey(name: 'open_issues_count') required int issues,
    @JsonKey(name: 'html_url') required String url,
    @JsonKey(name: 'owner') required ApiOwnerResponse owner,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
