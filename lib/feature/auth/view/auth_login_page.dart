import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repositories/common_widget/toast/show_toast.dart';
import 'package:search_repositories/config/key/secure_storage_key.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/custom_padding.dart';
import 'package:search_repositories/config/util/height_margin.dart';
import 'package:search_repositories/config/util/width_margin.dart';
import 'package:search_repositories/feature/auth/controller/auth_controller.dart';
import 'package:search_repositories/feature/auth/controller/secure_storage_controller.dart';

class AuthLoginPage extends ConsumerWidget {
  const AuthLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(CustomPadding.large),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Column(
                children: [
                  Text(
                    'ようこそ！',
                    style: TextStyle(
                      fontSize: CustomFontSize.largest,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  HeightMargin.large,
                  Text(
                    'このアプリではGitHubのリポジトリを検索できます。機能を使うにはGitHub連携が必要です。',
                    style: TextStyle(fontSize: CustomFontSize.medium),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 1,
                    shadowColor: Theme.of(context).colorScheme.tertiary,
                  ),
                  onPressed: () async {
                    await _signInWithGitHub(ref);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/github_icon/github-mark.png',
                        width: 34,
                        height: 34,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      WidthMargin.normal,
                      const Text(
                        'Sign in to GitHub',
                        style: TextStyle(fontSize: CustomFontSize.medium),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signInWithGitHub(WidgetRef ref) async {
    final UserCredential? credentail =
        await ref.read(authControllerProvider.notifier).signInWithGitHub();
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
  }
}
