import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repositories/config/key/map_key.dart';

class RepositoryDetailPage extends ConsumerWidget {
  const RepositoryDetailPage({super.key, required this.repository});

  final Map<String, dynamic> repository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(repository[MapKey.name])),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // オーナーのアイコンと名前
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      repository[MapKey.ownerAvatarUrl],
                    ),
                    radius: 24,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    repository[MapKey.ownerLogin],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 説明文
              Text(
                repository[MapKey.description] ?? 'No description provided.',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              // プロジェクト言語
              if (repository[MapKey.language] != null)
                Text(
                  '🛠 Language: ${repository[MapKey.language]}',
                  style: const TextStyle(fontSize: 16),
                ),

              const SizedBox(height: 20),

              // スター・ウォッチャー・フォーク・イシュー
              Wrap(
                spacing: 16,
                runSpacing: 10,
                children: [
                  _infoChip('⭐ Stars', repository[MapKey.stars].toString()),
                  _infoChip(
                    '👁 Watchers',
                    repository[MapKey.watchers].toString(),
                  ),
                  _infoChip('🍴 Forks', repository[MapKey.forks].toString()),
                  _infoChip('🐞 Issues', repository[MapKey.issues].toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoChip(String label, String value) {
    return Chip(
      label: Text('$label: $value'),
      backgroundColor: Colors.blue.shade50,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }
}
