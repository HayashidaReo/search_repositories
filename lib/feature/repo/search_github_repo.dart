import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Map<String, dynamic>>> searchGitHubRepo(String keyword) async {
  final url = Uri.parse(
    'https://api.github.com/search/repositories?q=$keyword&sort=stars&order=desc',
  );

  final headers = {'Accept': 'application/vnd.github.v3+json'};

  final response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final items = data['items'] as List;

    return items
        .map(
          (repo) => {
            'name': repo['full_name'],
            'description': repo['description'],
            'stars': repo['stargazers_count'],
            'url': repo['html_url'],
          },
        )
        .toList();
  } else {
    throw Exception('GitHub API error: ${response.statusCode}');
  }
}
