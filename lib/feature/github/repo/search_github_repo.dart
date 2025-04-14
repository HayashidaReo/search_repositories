import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:search_repositories/config/util/github_api_error.dart';
import 'package:search_repositories/feature/github/model/api_response.dart';

Future<List<ApiResponse>> searchGitHubRepo(
  String keyword,
  Uri url,
  Map<String, String> headers,
  BuildContext context,
) async {
  final AppLocalizations l10n = AppLocalizations.of(context)!;
  final response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    // 成功
    final data = json.decode(response.body) as Map<String, dynamic>;
    final items = data['items'] as List<dynamic>;

    return items
        .map((item) => ApiResponse.fromJson(item as Map<String, dynamic>))
        .toList();
  } else if (response.statusCode == 401) {
    // 認証エラー
    throw GitHubApiError(
      message: l10n.authError,
      statusCode: response.statusCode,
    );
  } else if (response.statusCode == 403) {
    // アクセス制限
    throw GitHubApiError(
      message: l10n.rateLimitError,
      statusCode: response.statusCode,
    );
  } else if (response.statusCode == 404) {
    // リソースが見つからない
    throw GitHubApiError(
      message: l10n.notFoundError,
      statusCode: response.statusCode,
    );
  } else if (response.statusCode == 500) {
    // サーバーエラー
    throw GitHubApiError(
      message: l10n.serverError,
      statusCode: response.statusCode,
    );
  } else {
    throw GitHubApiError(
      message: l10n.unexpectedError,
      statusCode: response.statusCode,
    );
  }
}
