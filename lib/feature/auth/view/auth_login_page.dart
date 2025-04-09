import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repositories/feature/auth/controller/auth_controller.dart';

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
              print(credentail);
            },
            child: const Text('Login with GitHub'),
          ),
        ),
      ),
    );
  }
}
