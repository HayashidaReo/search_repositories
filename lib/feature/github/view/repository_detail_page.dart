import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:search_repositories/common_widget/loading_widget.dart';
import 'package:search_repositories/config/util/color_style.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/custom_padding.dart';
import 'package:search_repositories/config/util/height_margin.dart';
import 'package:search_repositories/config/util/width_margin.dart';
import 'package:search_repositories/feature/github/model/api_response.dart';
import 'package:search_repositories/common_widget/icon_info_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:search_repositories/function/launch_url.dart';

part 'part/icon_image.dart';

class RepositoryDetailPage extends ConsumerWidget {
  const RepositoryDetailPage({super.key, required this.repository});

  final ApiResponse repository;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double iconSize = 36;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              // レポジトリへ遷移
              launchInExternalBrowser(repository.url);
            },
            icon: const Icon(Icons.open_in_new),
          ),
          WidthMargin.small,
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: CustomPadding.normal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // アイコン
                  IconImage(
                    imageUrl: repository.owner.avatarUrl,
                    iconSize: iconSize,
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
              HeightMargin.small,
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      '開発者',
                      style: TextStyle(
                        fontSize: CustomFontSize.small,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                  WidthMargin.small,
                  Text(
                    repository.owner.login,
                    style: const TextStyle(fontSize: CustomFontSize.small),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      '開発言語',
                      style: TextStyle(
                        fontSize: CustomFontSize.small,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                  WidthMargin.small,
                  Text(
                    repository.language ?? '不明',
                    style: const TextStyle(fontSize: CustomFontSize.small),
                  ),
                ],
              ),
              HeightMargin.normal,
              // 説明文
              ReadMoreText(
                repository.description ?? '詳細がありません',
                textAlign: TextAlign.start,
                trimLines: 1,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' さらに表示',
                trimExpandedText: ' 折りたたむ',
                style: const TextStyle(fontSize: CustomFontSize.normal),
                moreStyle: const TextStyle(
                  fontSize: CustomFontSize.small,
                  color: ColorStyle.blueAccent,
                ),
                lessStyle: const TextStyle(
                  fontSize: CustomFontSize.small,
                  color: ColorStyle.blueAccent,
                ),
              ),

              HeightMargin.small,

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
