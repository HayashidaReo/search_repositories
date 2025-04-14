part of '../auth_login_page.dart';

class LanguageToggleButton extends ConsumerWidget {
  const LanguageToggleButton({
    super.key,
    required this.localizations,
    required this.currentLocale,
  });

  final AppLocalizations? localizations;
  final Locale currentLocale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<Locale>(
      tooltip: localizations!.languageSettings,
      onSelected: (Locale locale) {
        ref.read(localeNotifierProvider.notifier).setLocale(locale);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CustomPadding.normal),
        child: Row(
          children: [
            // 言語テキスト
            Text(
              localizations!.languageSettings,
              style: const TextStyle(
                color: ColorStyle.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            WidthMargin.small,
            // 地球儀アイコン
            const Icon(Icons.language, color: ColorStyle.blueAccent),
          ],
        ),
      ),
      itemBuilder:
          (BuildContext context) =>
              LanguageConfig.supportedLocales.map((locale) {
                return _languagePopupMenuItem(
                  currentLocale: currentLocale,
                  languageCode: locale.languageCode,
                  languageName: LanguageConfig.getLanguageName(
                    locale.languageCode,
                  ),
                );
              }).toList(),
    );
  }

  PopupMenuItem<Locale> _languagePopupMenuItem({
    required Locale currentLocale,
    required String languageCode,
    required String languageName,
  }) {
    return PopupMenuItem<Locale>(
      value: Locale(languageCode),
      child: Row(
        children: [
          if (currentLocale.languageCode == languageCode)
            const Icon(Icons.check, size: 18),
          WidthMargin.small,
          Text(
            languageName,
            style: const TextStyle(fontSize: CustomFontSize.small),
          ),
        ],
      ),
    );
  }
}
