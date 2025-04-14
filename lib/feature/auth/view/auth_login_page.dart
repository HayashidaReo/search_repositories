import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repositories/common_widget/dialog/loading_dialog.dart';
import 'package:search_repositories/common_widget/loading_widget.dart';
import 'package:search_repositories/config/locale/controller/locale_provider.dart';
import 'package:search_repositories/config/locale/language_config.dart';
import 'package:search_repositories/config/util/app_assets.dart';
import 'package:search_repositories/config/util/color_style.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/custom_padding.dart';
import 'package:search_repositories/config/util/height_margin.dart';
import 'package:search_repositories/config/util/width_margin.dart';
import 'package:search_repositories/feature/auth/controller/auth_controller.dart';

part './part/language_toggle_button.dart';

class AuthLoginPage extends ConsumerWidget {
  const AuthLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 多言語対応
    final AppLocalizations? localizations = AppLocalizations.of(context);
    // 現在の言語を取得
    final currentLocale = ref.watch(localeNotifierProvider);

    // AppLocalizations が取得できていない場合はローディングを表示
    if (localizations == null) {
      return const Scaffold(body: Center(child: LoadingWidget()));
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          // 言語切り替えボタン
          LanguageToggleButton(
            localizations: localizations,
            currentLocale: currentLocale,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(CustomPadding.large),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  // ようこそテキスト
                  Text(
                    localizations.welcome,
                    style: const TextStyle(
                      fontSize: CustomFontSize.largest,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  HeightMargin.large,
                  // 説明テキスト
                  Text(
                    localizations.appDescription,
                    style: const TextStyle(fontSize: CustomFontSize.medium),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                // 言語切り替えボタン
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    // GitHubでアカウント作成 or サインイン
                    await _signInWithGitHub(ref, localizations);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // GitHubアイコン
                      Image.asset(
                        AppAssets.githubIcon,
                        width: 34,
                        height: 34,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      WidthMargin.normal,
                      // 「GitHubでサインイン」テキスト
                      Text(
                        localizations.signInGitHub,
                        style: const TextStyle(fontSize: CustomFontSize.medium),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithGitHub(
    WidgetRef ref,
    AppLocalizations localizations,
  ) async {
    showLoadingDialog(localizations.connecting);
    await ref
        .read(authControllerProvider.notifier)
        .signInWithGitHub(localizations);
  }
}
