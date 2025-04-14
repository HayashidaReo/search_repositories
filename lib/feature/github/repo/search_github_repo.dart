import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:search_repositories/feature/github/model/api_response.dart';

/// GitHubレポジトリを検索する関数
/// 401エラーが発生した場合は1回だけリトライする
Future<List<ApiResponse>> searchGitHubRepo(
  String keyword,
  Uri url,
  Map<String, String> headers, {
  bool isRetry = false,
}) async {
  try {
    final response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      final items = data['items'] as List<dynamic>;

      return items
          .map((item) => ApiResponse.fromJson(item as Map<String, dynamic>))
          .toList();
    } else if (response.statusCode == 401 && !isRetry) {
      // 認証エラーで、まだリトライしていない場合は、少し待ってからリトライ
      await Future.delayed(const Duration(milliseconds: 500));
      return searchGitHubRepo(keyword, url, headers, isRetry: true);
    } else {
      throw Exception(
        'GitHub API error: ${response.statusCode} - ${response.body}',
      );
    }
  } catch (e) {
    print('GitHub API error: $e');
    throw Exception('Failed to fetch repositories: $e');
  }
}
