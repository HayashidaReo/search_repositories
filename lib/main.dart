import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:search_repositories/config/firebase/firebase_options.dart';
import 'package:search_repositories/config/locale/controller/locale_provider.dart';
import 'package:search_repositories/config/routing/app_router.dart';
import 'package:search_repositories/config/theme/app_theme.dart';
import 'package:search_repositories/config/theme/theme_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter appRouter = ref.watch(appRouterProvider);
    final themeMode = ref.watch(themeControllerProvider);
    return MaterialApp.router(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: ref.watch(localeNotifierProvider), //初期言語
      localeResolutionCallback: (locale, supportedLocales) {
        if (locale == null) {
          return const Locale('en'); // デフォルトを日本語に設定
        }
        for (final supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode) {
            return supportedLocale;
          }
        }
        return const Locale('en'); // どの言語もマッチしない場合、日本語を適用
      },
    );
  }
}
