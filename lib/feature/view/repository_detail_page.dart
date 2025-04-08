import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class RepositoryDetailPage extends ConsumerWidget {
  const RepositoryDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: SafeArea(child: Center(child: Text('詳細ページ'))),
    );
  }
}
