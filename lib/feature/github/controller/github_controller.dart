import 'dart:developer';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories/config/key/secure_storage_key.dart';
import 'package:search_repositories/feature/auth/controller/secure_storage_controller.dart';
import 'package:search_repositories/feature/github/model/api_response.dart';
import 'package:search_repositories/feature/github/repo/search_github_repo.dart';

/*
GitHub Repositoryの検索をするためのController
*/
Future<List<ApiResponse>> searchGitHubController(
  String keyword,
  WidgetRef ref,
) async {
  try {
    // 検索キーワードが空の場合は、デフォルトで検索する値を設定
    final String queryKeyword = keyword.isEmpty ? 'stars:>10000' : keyword;

    // GitHubのAPIのURL設定
    final String urlString =
        'https://api.github.com/search/repositories?q=$queryKeyword&sort=stars&order=desc';
    final Uri url = Uri.parse(urlString);

    // アクセストークンの取得
    final String? accessToken = await _getGitHubAccessToken(ref);
    if (accessToken == null || accessToken.isEmpty) {
      log('GitHub access token is not set or empty');
      throw Exception('GitHubへのアクセストークンが見つかりません。再度ログインしてください。');
    }

    // ヘッダーの設定
    final Map<String, String> headers = {
      'Authorization': 'token $accessToken',
      'Accept': 'application/vnd.github.v3+json',
    };

    // リポジトリの検索実行
    return await searchGitHubRepo(queryKeyword, url, headers);
  } catch (e) {
    log('Error in searchGitHubController: $e');
    throw Exception('GitHub APIへのアクセスに失敗しました: ${e.toString()}');
  }
}

/*
GitHubのアクセストークンを取得する
*/
Future<String?> _getGitHubAccessToken(WidgetRef ref) async {
  try {
    final String? accessToken = await ref
        .read(secureStorageControllerProvider.notifier)
        .getValue(key: SecureStorageKey.githubAccessToken);

    // アクセストークンが取得できなかった場合はログに記録
    if (accessToken == null || accessToken.isEmpty) {
      log('Failed to retrieve GitHub access token from secure storage');
    } else {
      log('Successfully retrieved GitHub access token');
    }

    return accessToken;
  } catch (e) {
    log('Error retrieving GitHub access token: $e');
    return null;
  }
}
