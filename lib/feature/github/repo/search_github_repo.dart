import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:search_repositories/config/util/github_api_error.dart';
import 'package:search_repositories/feature/github/model/api_response.dart';

Future<List<ApiResponse>> searchGitHubRepo(
  String keyword,
  Uri url,
  Map<String, String> headers,
) async {
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
      message: '認証に失敗しました。一度ログアウトし、GitHubアカウントに接続し直してください。',
      statusCode: response.statusCode,
    );
  } else if (response.statusCode == 403) {
    // アクセス制限
    throw GitHubApiError(
      message: 'アクセス制限がかかりました。時間をおいてお試しください。',
      statusCode: response.statusCode,
    );
  } else if (response.statusCode == 404) {
    // リソースが見つからない
    throw GitHubApiError(
      message: '見つかりませんでした。',
      statusCode: response.statusCode,
    );
  } else if (response.statusCode == 500) {
    // サーバーエラー
    throw GitHubApiError(
      message: 'サーバーに問題があります。しばらく経ってから再度お試しください。',
      statusCode: response.statusCode,
    );
  } else {
    throw GitHubApiError(
      message: '予期せぬエラーが発生しました。',
      statusCode: response.statusCode,
    );
  }
}
