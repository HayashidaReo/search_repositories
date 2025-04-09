import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repositories/feature/auth/repo/auth_repo.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  void build() {
    return;
  }

  Future<UserCredential?> signInWithGitHub() async {
    return await ref.read(authRepoProvider.notifier).signInWithGitHub();
  }

  Future<void> signOut() async {
    await ref.read(authRepoProvider.notifier).signOut();
  }
}
