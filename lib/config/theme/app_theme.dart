import 'package:flutter/material.dart';
import 'package:search_repositories/config/util/color_style.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';

/// アプリ全体のテーマを定義するクラス
class AppTheme {
  /// ライトモード用のテーマ
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: ColorStyle.black,
      secondary: ColorStyle.white,
      // 色を一目でわかりやすいようにするためlintsを無視
      // ignore: avoid_redundant_argument_values
      onPrimary: ColorStyle.white,
      onSecondary: ColorStyle.darkBlack,
      primaryContainer: ColorStyle.lightGrey,
      tertiary: ColorStyle.darkGrey,
    ),
    scaffoldBackgroundColor: ColorStyle.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorStyle.white,
      foregroundColor: ColorStyle.black,
      titleTextStyle: TextStyle(
        fontSize: CustomFontSize.large,
        fontWeight: FontWeight.bold,
        color: ColorStyle.black,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorStyle.white,
      elevation: 3,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(ColorStyle.darkBlack),
      trackColor: WidgetStateProperty.all(ColorStyle.white),
      trackOutlineColor: WidgetStateProperty.all(ColorStyle.darkBlack),
    ),
  );

  /// ダークモード用のテーマ
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: ColorStyle.lightGrey,
      secondary: ColorStyle.black,
      onPrimary: ColorStyle.darkBlack,
      onSecondary: ColorStyle.grey,
      primaryContainer: ColorStyle.black,
      tertiary: ColorStyle.darkGrey,
    ),
    scaffoldBackgroundColor: ColorStyle.darkBlack,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorStyle.darkBlack,
      foregroundColor: ColorStyle.white,
      titleTextStyle: TextStyle(
        fontSize: CustomFontSize.large,
        fontWeight: FontWeight.bold,
        color: ColorStyle.white,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: ColorStyle.black,
      elevation: 3,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.all(ColorStyle.darkBlack),
      trackColor: WidgetStateProperty.all(ColorStyle.mildBlack),
      trackOutlineColor: WidgetStateProperty.all(ColorStyle.grey),
    ),
  );
}
