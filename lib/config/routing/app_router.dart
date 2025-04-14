import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
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

// authRepoProviderの状態変化を監視するためのStreamController
final _authStateController = StreamController<User?>.broadcast();

// アプリ終了時にStreamControllerをクローズするための関数
void disposeAuthStateController() {
  _authStateController.close();
}

@riverpod
GoRouter appRouter(ref) {
  // authRepoProviderの状態変化を監視
  ref.listen(authRepoProvider, (previous, next) {
    if (_authStateController.isClosed) return;
    _authStateController.add(next);
  });
  // dispose時の処理
  ref.onDispose(() {
    if (!_authStateController.isClosed) {
      _authStateController.close();
    }
  });

  return GoRouter(
    initialLocation: AppRoute.auth.path,
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,

    // 状態が変わるたびにリダイレクトを実行
    refreshListenable: GoRouterRefreshStream(_authStateController.stream),
    // 認証状態に応じてリダイレクト処理を実装
    // アカウントにログインした後にあるトークンの保存処理まで完了してからリダイレクトする必要があるため、複雑なリダイレクト処理になっている
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
      // 外部認証からリダイレクト
      GoRoute(
        path: AppRoute.link.path,
        name: AppRoute.link.name,
        redirect: (_, __) {
          // リダイレクトされた場合は、認証ページにリダイレクト
          return AppRoute.auth.path;
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
