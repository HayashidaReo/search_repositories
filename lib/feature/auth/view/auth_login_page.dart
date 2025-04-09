import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repositories/config/key/secure_storage_key.dart';
import 'package:search_repositories/feature/auth/controller/auth_controller.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:search_repositories/feature/auth/controller/secure_storage_controller.dart';

class AuthLoginPage extends ConsumerWidget {
  const AuthLoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              final UserCredential? credentail =
                  await ref
                      .read(authControllerProvider.notifier)
                      .signInWithGitHub();
              if (credentail != null &&
                  ((credentail.credential as OAuthCredential?) != null)) {
                // 認証成功
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Login Success')));
                await ref
                    .read(secureStorageControllerProvider.notifier)
                    .setValue(
                      key: SecureStorageKey.githubAccessToken,
                      value:
                          (credentail.credential as OAuthCredential)
                              .accessToken ??
                          '',
                    );
              } else {
                // 認証失敗
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('Login Failed')));
              }
            },
            child: const Text('Login with GitHub'),
          ),
        ),
      ),
    );
  }
}
