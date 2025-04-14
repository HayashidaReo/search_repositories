enum AppRoute { auth, repositoryList, repositoryDetail }

extension AppRouteExtention on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.auth:
        return '/auth';
      case AppRoute.repositoryList:
        return '/repositoryList';
      case AppRoute.repositoryDetail:
        return '/repositoryDetail';
    }
  }
}
