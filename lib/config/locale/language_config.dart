import 'package:flutter/material.dart';

/// 言語設定の一覧を管理するクラス
class LanguageConfig {
  /// 言語コードをキーにした言語名のマップ
  static const Map<String, String> languageNames = {
    'ja': '日本語',
    'en': 'English',
    'ko': '한국어',
    'zh': '简体中文',
  };

  /// アプリで対応している言語のロケールリスト
  static List<Locale> get supportedLocales =>
      languageNames.keys.map((languageCode) => Locale(languageCode)).toList();

  /// 言語コードから言語名を取得するメソッド
  static String getLanguageName(String languageCode) {
    return languageNames[languageCode] ?? 'Unknown';
  }

  /// 指定された言語コードのロケールを取得するメソッド
  static Locale getLocaleByCode(String languageCode) {
    return Locale(languageCode);
  }
}
