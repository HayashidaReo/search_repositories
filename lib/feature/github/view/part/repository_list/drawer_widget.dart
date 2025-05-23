part of '../../repository_list_page.dart';

class DrawerWidget extends ConsumerWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 現在の言語を取得
    final currentLocale = ref.watch(localeNotifierProvider);
    final localizations = AppLocalizations.of(context);

    // localizationsがnullの場合はエラー防止のためローディング表示
    if (localizations == null) {
      return const Drawer(child: LoadingWidget());
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(
              localizations.appTitle,
              style: const TextStyle(fontSize: CustomFontSize.large),
            ),
          ),
          // ダークモードの切り替え
          ListTile(
            title: Row(
              children: [
                Text(
                  (ref.watch(themeControllerProvider) == ThemeMode.dark)
                      ? localizations.darkMode
                      : localizations.lightMode,
                ),
                WidthMargin.small,
                Icon(
                  (ref.watch(themeControllerProvider) == ThemeMode.dark)
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
              ],
            ),
            trailing: Switch(
              value: ref.watch(themeControllerProvider) == ThemeMode.dark,
              onChanged: (value) {
                ref
                    .read(themeControllerProvider.notifier)
                    .setThemeMode(value ? ThemeMode.dark : ThemeMode.light);
              },
            ),
          ),
          // 言語設定ボタン
          LanguageToggleTile(currentLocale: currentLocale),
          HeightMargin.normal,
          // ログアウト
          ListTile(
            title: Text(localizations.logout),
            onTap: () async {
              _logout(context, ref, localizations);
            },
          ),
          // アカウント削除
          ListTile(
            title: Text(localizations.deleteAccount),
            onTap: () async {
              _deleteAccount(context, ref, localizations);
            },
          ),
        ],
      ),
    );
  }

  /// ログアウト
  void _logout(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations localizations,
  ) {
    return showConfirmDialog(
      context: context,
      text: localizations.logoutConfirmation,
      onPressed: () async {
        context.pop();
        showLoadingDialog(localizations.loggingOut);
        await ref.read(authControllerProvider.notifier).signOut();
        hideLoadingDialog();
        showToast(localizations.loggedOut);
      },
    );
  }

  /// アカウント削除
  void _deleteAccount(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations localizations,
  ) {
    return showConfirmDialog(
      context: context,
      text: localizations.deleteConfirmation,
      onPressed: () async {
        context.pop();
        showLoadingDialog(localizations.deleting);
        await ref.read(authControllerProvider.notifier).delete();
        hideLoadingDialog();
        showToast(localizations.accountDeleted);
      },
    );
  }
}
