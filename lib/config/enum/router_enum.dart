enum AppRoute { repositoryList, repositoryDetail }

extension AppRouteExtention on AppRoute {
  String get path {
    switch (this) {
      case AppRoute.repositoryList:
        return '/repositoryList';
      case AppRoute.repositoryDetail:
        return '/repositoryDetail';
    }
  }
}
