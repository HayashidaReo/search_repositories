import 'package:firebase_auth/firebase_auth.dart';
import 'package:search_repositories/feature/github/model/api_response.dart';
import 'package:search_repositories/feature/github/repo/search_github_repo.dart';

Future<List<ApiResponse>> searchGitHubController(String keyword) async {
  final String defaultQuery = 'stars:>10000';
  final String query = keyword.trim().isEmpty ? defaultQuery : keyword;
  final Uri url = Uri.parse(
    'https://api.github.com/search/repositories?q=$query&sort=stars&order=desc',
  );

  final Map<String, String> headers = {
    'Accept': 'application/vnd.github.v3+json',
    'Authorization':
        'Bearer ${FirebaseAuth.instance.currentUser?.getIdToken()}',
  };

  return searchGitHubRepo(keyword, url, headers);
}
