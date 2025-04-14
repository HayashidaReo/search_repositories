enum AppRoute { link, auth, repositoryList, repositoryDetail }

extension AppRouteExtention on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.link:
        return '/link';
      case AppRoute.auth:
        return '/auth';
      case AppRoute.repositoryList:
        return '/repositoryList';
      case AppRoute.repositoryDetail:
        return '/repositoryDetail';
    }
  }
}
