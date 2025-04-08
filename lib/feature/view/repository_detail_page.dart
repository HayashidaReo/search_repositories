import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:search_repositories/feature/repo/search_github_repo.dart';

class RepositoryDetailPage extends ConsumerWidget {
  const RepositoryDetailPage({super.key, required this.repository});
  final Map<String, dynamic> repository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              final results = await searchGitHubRepo('flutter');
              for (var repo in results) {
                print('${repo['name']} ⭐${repo['stars']}');
              }
            },
            child: Text(repository['name'] ?? 'No name'),
          ),
        ),
      ),
    );
  }
}
