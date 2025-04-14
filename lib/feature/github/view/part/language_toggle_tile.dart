part of '../repository_list_page.dart';

class LanguageToggleTile extends ConsumerWidget {
  const LanguageToggleTile({super.key, required this.currentLocale});

  final Locale currentLocale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpansionTile(
      title: const Text('言語設定'),
      children: [
        RadioListTile<Locale>(
          title: const Text('日本語'),
          value: const Locale('ja'),
          groupValue: currentLocale,
          onChanged: (Locale? value) {
            _setLocale(value, ref);
          },
        ),
        RadioListTile<Locale>(
          title: const Text('English'),
          value: const Locale('en'),
          groupValue: currentLocale,
          onChanged: (Locale? value) {
            _setLocale(value, ref);
          },
        ),
        RadioListTile<Locale>(
          title: const Text('한국어'),
          value: const Locale('ko'),
          groupValue: currentLocale,
          onChanged: (Locale? value) {
            _setLocale(value, ref);
          },
        ),
        RadioListTile<Locale>(
          title: const Text('中文'),
          value: const Locale('zh'),
          groupValue: currentLocale,
          onChanged: (Locale? value) {
            _setLocale(value, ref);
          },
        ),
      ],
    );
  }

  void _setLocale(Locale? value, WidgetRef ref) {
    if (value != null) {
      ref.read(localeNotifierProvider.notifier).setLocale(value);
    }
  }
}
