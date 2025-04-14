import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repositories/common_widget/dialog/loading_dialog.dart';
import 'package:search_repositories/common_widget/toast/show_toast.dart';
import 'package:search_repositories/config/firebase/firebase_instance_provider.dart';
import 'package:search_repositories/config/key/secure_storage_key.dart';
import 'package:search_repositories/feature/auth/controller/secure_storage_controller.dart';

part 'auth_repo.g.dart';

@riverpod
class AuthRepo extends _$AuthRepo {
  @override
  User? build() {
    return ref.read(firebaseAuthInstanceProvider).currentUser;
  }

  /// githubの認証
  Future<void> signInWithGitHub(AppLocalizations localizations) async {
    try {
      final GithubAuthProvider githubProvider = GithubAuthProvider();

      final UserCredential credentail = await FirebaseAuth.instance
          .signInWithProvider(githubProvider);
      // 認証成功
      if (((credentail.credential?.accessToken) != null)) {
        await ref
            .read(secureStorageControllerProvider.notifier)
            .setValue(
              key: SecureStorageKey.githubAccessToken,
              value: credentail.credential?.accessToken ?? '',
            );
        hideLoadingDialog();
        showToast(localizations.connectionSuccess);
        state = ref.read(firebaseAuthInstanceProvider).currentUser;
      } else {
        // アクセストークンが取得できなかった場合
        hideLoadingDialog();
        showToast(localizations.tokenFailure);
      }
    } on FirebaseAuthException {
      hideLoadingDialog();
      showToast(localizations.connectionFailure);
    } catch (e) {
      // その他の予期しないエラー
      hideLoadingDialog();
      showToast(localizations.connectionFailure);
    }
  }

  /// ログアウト処理
  Future<void> signOut() async {
    await ref.read(firebaseAuthInstanceProvider).signOut();
    state = ref.read(firebaseAuthInstanceProvider).currentUser;
  }

  /// アカウント削除処理
  Future<void> delete() async {
    await ref.read(authRepoProvider.notifier).delete();
  }
}
