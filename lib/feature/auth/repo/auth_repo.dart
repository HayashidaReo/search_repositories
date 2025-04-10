import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:search_repositories/config/firebase/firebase_instance_provider.dart';

part 'auth_repo.g.dart';

@riverpod
class AuthRepo extends _$AuthRepo {
  @override
  User? build() {
    return ref.read(firebaseAuthInstanceProvider).currentUser;
  }

  // githubの認証
  Future<UserCredential?> signInWithGitHub() async {
    try {
      final GithubAuthProvider githubProvider = GithubAuthProvider();

      final result = await FirebaseAuth.instance.signInWithProvider(
        githubProvider,
      );
      return result;
    } on FirebaseAuthException {
      return null;
    } catch (e) {
      // その他の予期しないエラー
      return null;
    }
  }

  //ログアウト処理
  Future<void> signOut() async {
    await ref.read(firebaseAuthInstanceProvider).signOut();
    state = ref.read(firebaseAuthInstanceProvider).currentUser;
  }

  // アカウント削除処理
  Future<void> delete() async {
    await ref.read(authRepoProvider.notifier).delete();
  }

  // Authの状態を監視する
  Stream<User?> authStateChange() {
    return ref.watch(firebaseAuthInstanceProvider).authStateChanges().map((
      User? currentUser,
    ) {
      state = currentUser;
      return state;
    });
  }
}
