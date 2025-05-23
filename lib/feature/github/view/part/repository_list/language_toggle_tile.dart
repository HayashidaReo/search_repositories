part of '../../repository_list_page.dart';

class LanguageToggleTile extends ConsumerWidget {
  const LanguageToggleTile({super.key, required this.currentLocale});

  final Locale currentLocale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /*
    多言語対応
    */
    final AppLocalizations? localizations = AppLocalizations.of(context);
    // AppLocalizations が取得できていない場合はローディングを表示
    if (localizations == null) {
      return const Scaffold(body: Center(child: LoadingWidget()));
    }

    return ExpansionTile(
      title: Text(localizations.languageSettings),
      children:
          // 言語設定のラジオボタンをmapで作成
          LanguageConfig.supportedLocales.map((locale) {
            return RadioListTile<Locale>(
              title: Text(LanguageConfig.getLanguageName(locale.languageCode)),
              value: locale,
              groupValue: currentLocale,
              onChanged: (Locale? value) {
                // 言語変更を保存
                if (value != null) {
                  ref.read(localeNotifierProvider.notifier).setLocale(value);
                }
              },
            );
          }).toList(),
    );
  }
}
