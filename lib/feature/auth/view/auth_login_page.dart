import 'package:flutter/material.dart';

class AuthLoginPage extends StatelessWidget {
  const AuthLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Login with GitHub'),
          ),
        ),
      ),
    );
  }
}
