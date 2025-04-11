import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories/config/key/secure_storage_key.dart';
import 'package:search_repositories/feature/auth/controller/secure_storage_controller.dart';
import 'package:search_repositories/feature/github/model/api_response.dart';
import 'package:search_repositories/feature/github/repo/search_github_repo.dart';

Future<List<ApiResponse>> searchGitHubController(
  String keyword,
  WidgetRef ref,
) async {
  const String defaultQuery = 'stars:>10000';
  final String query = keyword.trim().isEmpty ? defaultQuery : keyword;
  final Uri url = Uri.parse(
    'https://api.github.com/search/repositories?q=$query&sort=stars&order=desc',
  );

  // TODO: 文字が変わるたびに検索していたら瞬間的に何回もapi叩くから制限かかっちゃう
  final String? accessToken = await ref
      .read(secureStorageControllerProvider.notifier)
      .getValue(key: SecureStorageKey.githubAccessToken);

  final Map<String, String> headers = {
    'Accept': 'application/vnd.github.v3+json',
    'Authorization': 'Bearer ${accessToken ?? ''}',
  };

  return searchGitHubRepo(keyword, url, headers);
}
