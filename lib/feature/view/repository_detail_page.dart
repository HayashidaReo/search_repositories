import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/custom_padding.dart';
import 'package:search_repositories/config/util/width_margin.dart';
import 'package:search_repositories/feature/model/api_response.dart';

class RepositoryDetailPage extends ConsumerWidget {
  const RepositoryDetailPage({super.key, required this.repository});

  final ApiResponse repository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(repository.name)),
      body: SafeArea(
        child: Padding(
          padding: CustomPadding.normal,
          child: Column(
            children: [
              // オーナーのアイコンと名前
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(repository.owner.avatarUrl),
                    radius: 36,
                  ),
                  WidthMargin.normal,
                  Text(
                    repository.owner.login,
                    style: const TextStyle(
                      fontSize: CustomFontSize.large,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // 説明文
              Text(
                repository.description ?? 'No description provided.',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              // プロジェクト言語
              if (repository.language != null)
                Text(
                  '🛠 Language: ${repository.language}',
                  style: const TextStyle(fontSize: 16),
                ),

              const SizedBox(height: 20),

              // スター・ウォッチャー・フォーク・イシュー
              Wrap(
                spacing: 16,
                runSpacing: 10,
                children: [
                  _infoChip('⭐ Stars', repository.stars.toString()),
                  _infoChip('👁 Watchers', repository.watchers.toString()),
                  _infoChip('🍴 Forks', repository.forks.toString()),
                  _infoChip('🐞 Issues', repository.issues.toString()),
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
