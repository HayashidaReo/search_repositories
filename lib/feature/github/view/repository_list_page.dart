import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:search_repositories/common_widget/dialog/confirm_dialog.dart';
import 'package:search_repositories/common_widget/dialog/loading_dialog.dart';
import 'package:search_repositories/common_widget/error_text_widget.dart';
import 'package:search_repositories/common_widget/loading_widget.dart';
import 'package:search_repositories/common_widget/toast/show_toast.dart';
import 'package:search_repositories/common_widget/un_focus_keyboard_widget.dart';
import 'package:search_repositories/config/enum/router_enum.dart';
import 'package:search_repositories/config/theme/theme_controller.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/custom_padding.dart';
import 'package:search_repositories/config/util/height_margin.dart';
import 'package:search_repositories/config/util/none_border_text_field_decoration.dart';
import 'package:search_repositories/feature/auth/controller/auth_controller.dart';
import 'package:search_repositories/feature/github/controller/github_controller.dart';
import 'package:search_repositories/feature/github/model/api_response.dart';
import 'package:search_repositories/common_widget/icon_info_widget.dart';
import 'package:search_repositories/config/locale/controller/locale_provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'part/repository_list_tile.dart';
part 'part/drawer_widget.dart';
part 'part/language_toggle_tile.dart';

class RepositoryListPage extends HookConsumerWidget {
  const RepositoryListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController searchTextController =
        useTextEditingController();
    final ValueNotifier<String> keyword = useState<String>('');
    final ValueNotifier<Future<List<ApiResponse>>?> futureRepositories =
        useState<Future<List<ApiResponse>>?>(null);
    final ValueNotifier<bool> isLoading = useState<bool>(true);
    final ValueNotifier<String?> errorMessage = useState<String?>(null);

    /*
    多言語対応
    */
    final AppLocalizations? localizations = AppLocalizations.of(context);
    // AppLocalizations が取得できていない場合はローディングを表示
    if (localizations == null) {
      return const Scaffold(body: Center(child: LoadingWidget()));
    }

    // 初回ロード時とキーワード変更時にデータを取得
    useEffect(() {
      // 少し遅延してからデータを取得（認証が完了するまでの時間を確保）
      Future.delayed(const Duration(milliseconds: 300), () {
        _fetchRepositories(
          keyword.value,
          ref,
          futureRepositories,
          isLoading,
          errorMessage,
        );
      });
      return null;
    }, [keyword.value]);

    return UnFocusKeyBoardWidget(
      child: Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: TextField(
            controller: searchTextController,
            decoration: noneBorderTextFieldDecoration(
              label: localizations.searchTextFieldLabel,
              prefixIconOnPressed: null,
              prefixIcon: const SizedBox.shrink(),
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
              context: context,
            ),
            onChanged: (text) {
              keyword.value = text;
            },
          ),
        ),
        body: SafeArea(
          child:
              isLoading.value
                  ? const Center(child: LoadingWidget())
                  : errorMessage.value != null
                  ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ErrorTextWidget(text: errorMessage.value!),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            isLoading.value = true;
                            errorMessage.value = null;
                            _fetchRepositories(
                              keyword.value,
                              ref,
                              futureRepositories,
                              isLoading,
                              errorMessage,
                            );
                          },
                          child: const Text('再読み込み'),
                        ),
                      ],
                    ),
                  )
                  : FutureBuilder(
                    future: futureRepositories.value,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const LoadingWidget();
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ErrorTextWidget(text: snapshot.error.toString()),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  isLoading.value = true;
                                  errorMessage.value = null;
                                  _fetchRepositories(
                                    keyword.value,
                                    ref,
                                    futureRepositories,
                                    isLoading,
                                    errorMessage,
                                  );
                                },
                                child: const Text('再読み込み'),
                              ),
                            ],
                          ),
                        );
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const ErrorTextWidget(text: 'データが見つかりませんでした');
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

  // リポジトリ取得メソッド
  void _fetchRepositories(
    String keyword,
    WidgetRef ref,
    ValueNotifier<Future<List<ApiResponse>>?> futureRepositories,
    ValueNotifier<bool> isLoading,
    ValueNotifier<String?> errorMessage,
  ) {
    try {
      futureRepositories.value = searchGitHubController(keyword, ref);
      futureRepositories.value!
          .then((_) {
            isLoading.value = false;
          })
          .catchError((error) {
            isLoading.value = false;
            errorMessage.value = "データの取得に失敗しました: ${error.toString()}";

            // 1秒後に自動的に再試行する
            Future.delayed(const Duration(seconds: 1), () {
              if (errorMessage.value != null) {
                // まだエラー状態なら
                isLoading.value = true;
                errorMessage.value = null;
                _fetchRepositories(
                  keyword,
                  ref,
                  futureRepositories,
                  isLoading,
                  errorMessage,
                );
              }
            });
          });
    } catch (e) {
      isLoading.value = false;
      errorMessage.value = "予期せぬエラーが発生しました: ${e.toString()}";
    }
  }
}
