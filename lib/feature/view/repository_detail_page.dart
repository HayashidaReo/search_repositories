import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:search_repositories/config/util/color_style.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/custom_padding.dart';
import 'package:search_repositories/config/util/height_margin.dart';
import 'package:search_repositories/config/util/width_margin.dart';
import 'package:search_repositories/feature/model/api_response.dart';
import 'package:search_repositories/common_widget/icon_info_widget.dart';

class RepositoryDetailPage extends ConsumerWidget {
  const RepositoryDetailPage({super.key, required this.repository});

  final ApiResponse repository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: CustomPadding.normal,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // アイコン
                  CircleAvatar(
                    backgroundImage: NetworkImage(repository.owner.avatarUrl),
                    radius: 36,
                  ),
                  WidthMargin.normal,
                  // リポジトリ名
                  Flexible(
                    child: Text(
                      repository.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: CustomFontSize.large,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              HeightMargin.normal,
              // 説明文
              ReadMoreText(
                repository.description ?? '詳細がありません',
                textAlign: TextAlign.start,
                trimLines: 3,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' さらに表示',
                trimExpandedText: ' 折りたたむ',
                style: TextStyle(
                  fontSize: CustomFontSize.medium,
                  color: ColorStyle.black,
                ),
                moreStyle: TextStyle(
                  fontSize: CustomFontSize.medium,
                  color: ColorStyle.blueAccent,
                ),
                lessStyle: TextStyle(
                  fontSize: CustomFontSize.medium,
                  color: ColorStyle.blueAccent,
                ),
              ),

              HeightMargin.small,

              // // プロジェクト言語
              // if (repository.language != null)
              //   Text(
              //     '🛠 Language: ${repository.language}',
              //     style: const TextStyle(fontSize: 16),
              //   ),

              // const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconInfoWidget(icon: Icons.star, value: repository.stars),
                  IconInfoWidget(
                    icon: Icons.remove_red_eye,
                    value: repository.watchers,
                  ),
                  IconInfoWidget(
                    icon: Icons.call_split,
                    value: repository.forks,
                  ),
                  IconInfoWidget(
                    icon: Icons.bug_report,
                    value: repository.issues,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
