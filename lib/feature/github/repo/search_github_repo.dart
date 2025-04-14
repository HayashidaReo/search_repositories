import 'dart:convert';
import 'package:http/http.dart' as http;
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
    throw Exception(
      '認証に失敗しました。一度ログアウトし、githubアカウントに接続し直してください。: ${response.statusCode}',
    );
  } else if (response.statusCode == 403) {
    // アクセス制限
    throw Exception('アクセス制限がかかりました。時間をおいてお試しください。: ${response.statusCode}');
  } else if (response.statusCode == 404) {
    // リソースが見つからない
    throw Exception('見つかりませんでした。: ${response.statusCode}');
  } else if (response.statusCode == 500) {
    // サーバーエラー
    throw Exception('サーバーに問題があります。: ${response.statusCode}');
  } else {
    throw Exception('予期せぬエラーが発生しました。: ${response.statusCode}');
  }
}
