import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:search_repositories/config/enum/router_enum.dart';
import 'package:search_repositories/feature/repo/search_github_repo.dart';

class RepositoryListPage extends HookConsumerWidget {
  const RepositoryListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchTextController =
        useTextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: SafeArea(
        child: FutureBuilder(
          future: searchGitHubRepo('flutter'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data found'));
            }

            final List<Map<String, dynamic>> repositories =
                snapshot.data as List<Map<String, dynamic>>;
            return ListView.builder(
              itemCount: repositories.length,
              itemBuilder: (context, index) {
                final repo = repositories[index];
                return ListTile(
                  title: Text(repo['name']),
                  subtitle: Text(repo['description'] ?? 'No description'),
                  trailing: Text('⭐${repo['stars']}'),
                  onTap: () {
                    context.pushNamed(
                      AppRoute.repositoryDetail.name,
                      extra: repo,
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
