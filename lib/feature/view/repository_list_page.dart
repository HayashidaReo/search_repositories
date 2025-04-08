import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:search_repositories/config/enum/router_enum.dart';
import 'package:search_repositories/config/key/map_key.dart';
import 'package:search_repositories/feature/controller/github_controller.dart';
import 'package:search_repositories/feature/model/api_response.dart';

class RepositoryListPage extends HookConsumerWidget {
  const RepositoryListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchTextController =
        useTextEditingController();
    final ValueNotifier<String> keyword = useState('');
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchTextController,
          decoration: const InputDecoration(
            hintText: 'Search GitHub Repositories',
            border: OutlineInputBorder(),
          ),
          onSubmitted: (value) {
            keyword.value = value;
          },
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: searchGitHubController(keyword.value),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data found'));
            }

            final List<ApiResponse> repositories = snapshot.data!;
            return ListView.builder(
              itemCount: repositories.length,
              itemBuilder: (context, index) {
                final repo = repositories[index];
                return ListTile(
                  title: Text(repo.name),
                  subtitle: Text(repo.description ?? 'No description'),
                  trailing: Text('⭐${repo.stars}'),
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
