import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repositories/common_widget/toast/show_toast.dart';
import 'package:search_repositories/config/key/secure_storage_key.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/custom_padding.dart';
import 'package:search_repositories/feature/auth/controller/auth_controller.dart';
import 'package:search_repositories/feature/auth/controller/secure_storage_controller.dart';

class AuthLoginPage extends ConsumerWidget {
  const AuthLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(CustomPadding.large),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ようこそ！',
                style: const TextStyle(
                  fontSize: CustomFontSize.large,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Flexible(
                child: Text(
                  'このアプリでは、GitHubのリポジトリを検索することができます。\nアプリを利用の機能を利用するためにあなたのGitHubアカウントを接続してください。',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final UserCredential? credentail =
                      await ref
                          .read(authControllerProvider.notifier)
                          .signInWithGitHub();
                  if (credentail != null) {
                    // 認証成功
                    showToast('接続成功');
                    if (((credentail.credential?.accessToken) != null)) {
                      await ref
                          .read(secureStorageControllerProvider.notifier)
                          .setValue(
                            key: SecureStorageKey.githubAccessToken,
                            value: credentail.credential?.accessToken ?? '',
                          );
                    } else {
                      showToast('トークン取得に失敗');
                    }
                  } else {
                    // 認証失敗
                    showToast('接続に失敗');
                  }
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/github_icon/github-mark.png',
                      width: 24,
                      height: 24,
                    ),
                    const Text('Login with GitHub'),
                  ],
                ),
              ),
              SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
