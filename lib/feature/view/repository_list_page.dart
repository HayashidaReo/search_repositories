import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:search_repositories/config/enum/router_enum.dart';

class RepositoryListPage extends HookConsumerWidget {
  const RepositoryListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              context.pushNamed(AppRoute.repositoryDetail.name);
            },
            child: const Text('詳細ページへ'),
          ),
        ),
      ),
    );
  }
}
