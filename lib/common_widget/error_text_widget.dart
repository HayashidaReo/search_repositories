import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/custom_padding.dart';
import 'package:search_repositories/config/util/height_margin.dart';

class ErrorTextWidget extends ConsumerWidget {
  const ErrorTextWidget({
    super.key,
    required this.text,
    this.onRetry,
    this.statusCode,
  });

  final String text;
  final VoidCallback? onRetry;
  final int? statusCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(CustomPadding.large),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // エラーアイコン
            Icon(
              Icons.error_outline,
              size: 64,
              color: Theme.of(context).colorScheme.error,
            ),
            HeightMargin.normal,

            // エラーメッセージ
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: CustomFontSize.normal,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            HeightMargin.normal,
          ],
        ),
      ),
    );
  }
}
