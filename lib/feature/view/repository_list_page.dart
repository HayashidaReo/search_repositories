import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:search_repositories/common_widget/error_text_widget.dart';
import 'package:search_repositories/common_widget/loading_widget.dart';
import 'package:search_repositories/config/enum/router_enum.dart';
import 'package:search_repositories/config/util/color_style.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/width_margin.dart';
import 'package:search_repositories/feature/controller/github_controller.dart';
import 'package:search_repositories/feature/model/api_response.dart';
import 'package:search_repositories/function/format_stars.dart';

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
              return LoadingWidget();
            } else if (snapshot.hasError) {
              return ErrorTextWidget(text: snapshot.error.toString());
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return ErrorTextWidget(text: 'データが見つかりませんでした');
            }

            final List<ApiResponse> repositories = snapshot.data!;
            return ListView.separated(
              separatorBuilder:
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Divider(),
                  ),
              itemCount: repositories.length,
              itemBuilder: (context, index) {
                final repo = repositories[index];
                return ListTile(
                  title: Text(
                    repo.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorStyle.black,
                      fontSize: CustomFontSize.medium,
                    ),
                  ),
                  subtitle: Text(
                    repo.description ?? '詳細がありません',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: ColorStyle.darkGrey,
                      fontSize: CustomFontSize.small,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: ColorStyle.yellow),
                      WidthMargin.mini,
                      SizedBox(
                        width: 40,
                        child: Text(
                          formatStars(repo.stars),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
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
