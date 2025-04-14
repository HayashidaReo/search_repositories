class GitHubApiError implements Exception {
  final String message;
  final int statusCode;

  GitHubApiError({required this.message, required this.statusCode});

  @override
  String toString() {
    return message;
  }
}
