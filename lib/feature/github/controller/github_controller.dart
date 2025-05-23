import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories/config/key/secure_storage_key.dart';
import 'package:search_repositories/feature/auth/controller/secure_storage_controller.dart';
import 'package:search_repositories/feature/github/model/api_response.dart';
import 'package:search_repositories/feature/github/repo/search_github_repo.dart';

Future<List<ApiResponse>> searchGitHubController(
  String keyword,
  WidgetRef ref,
  BuildContext context,
) async {
  const String defaultQuery = 'stars:>10000';
  final String query = keyword.trim().isEmpty ? defaultQuery : keyword;
  final Uri url = Uri.parse(
    'https://api.github.com/search/repositories?q=$query&sort=stars&order=desc',
  );

  // githubのアクセストークンを取得
  final String? accessToken = await ref
      .read(secureStorageControllerProvider.notifier)
      .getValue(key: SecureStorageKey.githubAccessToken);
  final Map<String, String> headers = {
    'Accept': 'application/vnd.github.v3+json',
    'Authorization': 'Bearer ${accessToken ?? ''}',
  };

  if (context.mounted) {
    return searchGitHubRepo(keyword, url, headers, context);
  } else {
    return [];
  }
}
