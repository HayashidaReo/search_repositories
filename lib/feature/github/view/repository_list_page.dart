import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:search_repositories/common_widget/error_text_widget.dart';
import 'package:search_repositories/common_widget/loading_widget.dart';
import 'package:search_repositories/common_widget/toast/show_toast.dart';
import 'package:search_repositories/common_widget/un_focus_keyboard_widget.dart';
import 'package:search_repositories/config/enum/router_enum.dart';
import 'package:search_repositories/config/util/color_style.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/custom_padding.dart';
import 'package:search_repositories/config/util/height_margin.dart';
import 'package:search_repositories/config/util/none_border_text_field_decoration.dart';
import 'package:search_repositories/feature/auth/controller/auth_controller.dart';
import 'package:search_repositories/feature/github/controller/github_controller.dart';
import 'package:search_repositories/feature/github/model/api_response.dart';
import 'package:search_repositories/common_widget/icon_info_widget.dart';

part 'part/repository_list_tile.dart';

class RepositoryListPage extends HookConsumerWidget {
  const RepositoryListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchTextController =
        useTextEditingController();
    final ValueNotifier<String> keyword = useState<String>('');
    return UnFocusKeyBoardWidget(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                child: Text(
                  'GitHubリポジトリ検索',
                  style: TextStyle(
                    fontSize: CustomFontSize.large,
                    color: ColorStyle.white,
                  ),
                ),
              ),
              ListTile(
                title: const Text('ログアウト'),
                onTap: () async {
                  await ref.read(authControllerProvider.notifier).signOut();
                  showToast('ログアウトしました');
                },
              ),
              ListTile(
                title: const Text('削除'),
                onTap: () async {
                  await ref.read(authControllerProvider.notifier).delete();
                  showToast('アカウントを削除しました');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: TextField(
            controller: searchTextController,
            decoration: noneBorderTextFieldDecoration(
              label: 'レポジトリを検索',
              prefixIconOnPressed: null,
              prefixIcon: SizedBox.shrink(),
              suffixIconOnPressed:
                  (keyword.value.isNotEmpty)
                      ? () {
                        keyword.value = '';
                        searchTextController.clear();
                      }
                      : null,

              suffixIcon: Icon(
                (keyword.value.isEmpty)
                    ? Icons.search
                    : Icons.keyboard_backspace,
              ),
            ),
            onChanged: (text) {
              keyword.value = text;
            },
          ),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: searchGitHubController(keyword.value, ref),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: CustomPadding.normal,
                      ),
                      child: const Divider(),
                    ),
                itemCount: repositories.length,
                itemBuilder: (context, index) {
                  final repo = repositories[index];
                  return RepositoryListTile(repo: repo);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
