import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:search_repositories/config/key/map_key.dart';

Future<List<Map<String, dynamic>>> searchGitHubRepo(
  String keyword,
  Uri url,
  Map<String, String> headers,
) async {
  final response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final items = data['items'] as List;

    return items.map((repo) {
      return {
        MapKey.name: repo['full_name'],
        MapKey.description: repo['description'],
        MapKey.language: repo['language'],
        MapKey.stars: repo['stargazers_count'],
        MapKey.watchers: repo['watchers_count'],
        MapKey.forks: repo['forks_count'],
        MapKey.issues: repo['open_issues_count'],
        MapKey.ownerAvatarUrl: repo['owner']['avatar_url'],
        MapKey.ownerLogin: repo['owner']['login'],
        MapKey.url: repo['html_url'],
      };
    }).toList();
  } else {
    throw Exception('GitHub API error: ${response.statusCode}');
  }
}
