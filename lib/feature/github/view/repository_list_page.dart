import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories/common_widget/dialog/confirm_dialog.dart';
import 'package:search_repositories/common_widget/dialog/loading_dialog.dart';
import 'package:search_repositories/common_widget/error_text_widget.dart';
import 'package:search_repositories/common_widget/icon_info_widget.dart';
import 'package:search_repositories/common_widget/loading_widget.dart';
import 'package:search_repositories/common_widget/toast/show_toast.dart';
import 'package:search_repositories/common_widget/un_focus_keyboard_widget.dart';
import 'package:search_repositories/config/enum/router_enum.dart';
import 'package:search_repositories/config/locale/controller/locale_provider.dart';
import 'package:search_repositories/config/theme/theme_controller.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/custom_padding.dart';
import 'package:search_repositories/config/util/height_margin.dart';
import 'package:search_repositories/config/util/none_border_text_field_decoration.dart';
import 'package:search_repositories/feature/auth/controller/auth_controller.dart';
import 'package:search_repositories/feature/github/controller/github_controller.dart';
import 'package:search_repositories/feature/github/model/api_response.dart';

part 'part/repository_list/drawer_widget.dart';
part 'part/repository_list/language_toggle_tile.dart';
part 'part/repository_list/repository_list_tile.dart';
part 'part/repository_list/search_text_field.dart';

class RepositoryListPage extends HookConsumerWidget {
  const RepositoryListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // キーワードの状態を管理
    final ValueNotifier<String> submittedKeyword = useState<String>('');

    /*
    多言語対応
    */
    final AppLocalizations? localizations = AppLocalizations.of(context);
    // AppLocalizations が取得できていない場合はローディングを表示
    if (localizations == null) {
      return const Scaffold(body: Center(child: LoadingWidget()));
    }

    return UnFocusKeyBoardWidget(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          // 検索バー
          title: SearchTextField(
            localizations: localizations,
            onSearch: (keyword) {
              submittedKeyword.value = keyword;
            },
          ),
        ),
        body: SafeArea(
          // データを取得する
          child: FutureBuilder(
            future: searchGitHubController(submittedKeyword.value, ref),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingWidget();
              } else if (snapshot.hasError) {
                // エラーが発生した場合
                return ErrorTextWidget(text: snapshot.error.toString());
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                // データがない０件の場合
                return ErrorTextWidget(text: localizations.noSearchResults);
              }

              final List<ApiResponse> repositories = snapshot.data!;
              return ListView.separated(
                separatorBuilder:
                    (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: CustomPadding.normal,
                      ),
                      child: Divider(),
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
