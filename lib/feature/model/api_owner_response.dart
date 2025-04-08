import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_owner_response.freezed.dart';
part 'api_owner_response.g.dart';

@freezed
class ApiOwnerResponse with _$ApiOwnerResponse {
  factory ApiOwnerResponse({
    @JsonKey(name: 'avatar_url') required String avatarUrl,
    required String login,
  }) = _ApiOwnerResponse;

  factory ApiOwnerResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiOwnerResponseFromJson(json);
}
