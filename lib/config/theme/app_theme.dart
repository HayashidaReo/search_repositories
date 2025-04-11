import 'package:flutter/material.dart';
import 'package:search_repositories/config/util/color_style.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';

/// アプリ全体のテーマを定義するクラス
class AppTheme {
  /// ライトモード用のテーマ
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      brightness: Brightness.light,
      primary: ColorStyle.black,
      secondary: ColorStyle.white,
      onPrimary: ColorStyle.white,
      onSecondary: ColorStyle.darkBlack,
      primaryContainer: ColorStyle.lightGrey,
      tertiary: ColorStyle.darkGrey,
    ),
    scaffoldBackgroundColor: ColorStyle.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorStyle.white,
      foregroundColor: ColorStyle.black,
      titleTextStyle: const TextStyle(
        fontSize: CustomFontSize.large,
        fontWeight: FontWeight.bold,
        color: ColorStyle.black,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorStyle.white,
      elevation: 3,
    ),
  );

  /// ダークモード用のテーマ
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      brightness: Brightness.dark,
      primary: ColorStyle.lightGrey,
      secondary: ColorStyle.black,
      onPrimary: ColorStyle.darkBlack,
      onSecondary: ColorStyle.grey,
      primaryContainer: ColorStyle.black,
      tertiary: ColorStyle.darkGrey,
    ),
    scaffoldBackgroundColor: ColorStyle.darkBlack,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorStyle.darkBlack,
      foregroundColor: ColorStyle.white,
      titleTextStyle: const TextStyle(
        fontSize: CustomFontSize.large,
        fontWeight: FontWeight.bold,
        color: ColorStyle.white,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorStyle.black,
      elevation: 3,
    ),
  );
}
