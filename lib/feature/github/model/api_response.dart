import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_repositories/feature/github/model/api_owner_response.dart';

part 'api_response.freezed.dart';
part 'api_response.g.dart';

@freezed
abstract class ApiResponse with _$ApiResponse {
  // snake_caseのJSONをcamelCaseのDartに変換するために、fieldRenameを指定
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory ApiResponse({
    required String name,
    String? description,
    String? language,
    required int stargazersCount,
    required int watchersCount,
    required int forksCount,
    required int openIssuesCount,
    required String htmlUrl,
    required ApiOwnerResponse owner,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
