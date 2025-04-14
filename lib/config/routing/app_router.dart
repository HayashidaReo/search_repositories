import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repositories/config/routing/go_router_refresh_stream.dart';
import 'package:search_repositories/config/routing/router_enum.dart';
import 'package:search_repositories/feature/auth/repo/auth_repo.dart';
import 'package:search_repositories/feature/auth/view/auth_login_page.dart';
import 'package:search_repositories/feature/github/model/api_response.dart';
import 'package:search_repositories/feature/github/view/repository_detail_page.dart';
import 'package:search_repositories/feature/github/view/repository_list_page.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
@riverpod
GoRouter appRouter(ref) {
  return GoRouter(
    // initialLocation: AppRoute.repositoryList.path,
    initialLocation: AppRoute.auth.path,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,

    // 状態が変わるたびにリダイレクトを実行
    refreshListenable: GoRouterRefreshStream(
      ref.watch(authRepoProvider.notifier).authStateChange(),
    ),

    // 認証状態に応じてリダイレクト処理を実装
    redirect: (BuildContext context, GoRouterState state) {
      final bool loggedIn = ref.read(authRepoProvider) != null;
      final bool onAuthPage = state.uri.toString().startsWith(
        AppRoute.auth.path,
      );
      // ログインしていない場合で、認証ページにいなければ認証ページへリダイレクト
      if (!loggedIn) {
        return onAuthPage ? null : AppRoute.auth.path;
      }
      // ログイン済みで認証ページにいる場合はホームページへリダイレクト
      if (loggedIn && onAuthPage) {
        return AppRoute.repositoryList.path;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: AppRoute.auth.path,
        name: AppRoute.auth.name,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: AuthLoginPage());
        },
      ),
      GoRoute(
        path: AppRoute.repositoryList.path,
        name: AppRoute.repositoryList.name,
        pageBuilder: (context, state) {
          return const NoTransitionPage(child: RepositoryListPage());
        },
        routes: [
          GoRoute(
            path: AppRoute.repositoryDetail.path,
            name: AppRoute.repositoryDetail.name,
            pageBuilder: (context, state) {
              final ApiResponse repository = state.extra as ApiResponse;
              return MaterialPage(
                child: RepositoryDetailPage(repository: repository),
              );
            },
          ),
        ],
      ),
    ],
  );
}
