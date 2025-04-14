import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'locale_provider.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  static const String _kLanguageCode = 'languageCode';
  static const String _kScriptCode = 'scriptCode';
  static const String _kCountryCode = 'countryCode';

  @override
  Locale build() {
    _loadLocale();
    return const Locale('ja');
  }

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(_kLanguageCode);
    final scriptCode = prefs.getString(_kScriptCode);
    final countryCode = prefs.getString(_kCountryCode);

    if (languageCode != null) {
      state = Locale.fromSubtags(
        languageCode: languageCode,
        scriptCode: scriptCode,
        countryCode: countryCode,
      );
    }
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kLanguageCode, locale.languageCode);

    if (locale.scriptCode != null) {
      await prefs.setString(_kScriptCode, locale.scriptCode!);
    } else {
      await prefs.remove(_kScriptCode);
    }

    if (locale.countryCode != null) {
      await prefs.setString(_kCountryCode, locale.countryCode!);
    } else {
      await prefs.remove(_kCountryCode);
    }

    state = locale;
  }
}
