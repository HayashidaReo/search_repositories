import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// '$textの取得に失敗しました。'と表示される
class ErrorTextWidget extends ConsumerWidget {
  const ErrorTextWidget({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Text(
        '$textの取得に失敗しました。',
      ),
    );
  }
}
