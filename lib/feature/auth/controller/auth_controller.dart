import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repositories/config/key/secure_storage_key.dart';
import 'package:search_repositories/feature/auth/controller/secure_storage_controller.dart';
import 'package:search_repositories/feature/auth/repo/auth_repo.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  void build() {
    return;
  }

  /// githubアカウントでアカウントを作成 or サインイン
  Future<void> signInWithGitHub(AppLocalizations localizations) async {
    await ref.read(authRepoProvider.notifier).signInWithGitHub(localizations);
  }

  /// サインアウト
  Future<void> signOut() async {
    await ref
        .read(secureStorageControllerProvider.notifier)
        .deleteValue(key: SecureStorageKey.githubAccessToken);
    await ref.read(authRepoProvider.notifier).signOut();
  }

  /// アカウントを削除
  Future<void> delete() async {
    await ref
        .read(secureStorageControllerProvider.notifier)
        .deleteValue(key: SecureStorageKey.githubAccessToken);
    await ref.read(authRepoProvider.notifier).delete();
  }
}
