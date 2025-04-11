import 'package:flutter/material.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/width_margin.dart';
import 'package:search_repositories/function/format_stars.dart';

class IconInfoWidget extends StatelessWidget {
  const IconInfoWidget({super.key, required this.icon, required this.value});

  final IconData icon;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Theme.of(context).colorScheme.tertiary),
        WidthMargin.mini,
        Text(
          formatStars(value),
          style: TextStyle(
            fontSize: CustomFontSize.small,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
