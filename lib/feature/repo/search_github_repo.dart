import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:search_repositories/feature/model/api_response.dart';

Future<List<ApiResponse>> searchGitHubRepo(
  String keyword,
  Uri url,
  Map<String, String> headers,
) async {
  final response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    final data = json.decode(response.body) as Map<String, dynamic>;
    final items = data['items'] as List<dynamic>;

    return items
        .map((item) => ApiResponse.fromJson(item as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('GitHub API error: ${response.statusCode}');
  }
}
