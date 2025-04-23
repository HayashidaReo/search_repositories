import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_owner_response.freezed.dart';
part 'api_owner_response.g.dart';

@freezed
abstract class ApiOwnerResponse with _$ApiOwnerResponse {
  // snake_caseのJSONをcamelCaseのDartに変換するために、fieldRenameを指定
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  factory ApiOwnerResponse({required String avatarUrl, required String login}) =
      _ApiOwnerResponse;

  factory ApiOwnerResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiOwnerResponseFromJson(json);
}
