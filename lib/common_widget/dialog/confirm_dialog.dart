import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_repositories/common_widget/custom_button.dart';
import 'package:search_repositories/config/util/color_style.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/height_margin.dart';
import 'package:search_repositories/config/util/width_margin.dart';

void showConfirmDialog({
  required BuildContext context,
  required String text,
  required VoidCallback onPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return ConfirmDialog(text: text, onPressed: onPressed);
    },
  );
}

class ConfirmDialog extends StatelessWidget {
  const ConfirmDialog({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: ColorStyle.white,
      title: Text(
        '確認',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: CustomFontSize.large,
          fontWeight: FontWeight.bold,
          color: ColorStyle.black,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: CustomFontSize.normal,
              color: ColorStyle.darkBlack,
            ),
          ),
          HeightMargin.small,
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: CustomButton(
                onPressed: () {
                  context.pop();
                },
                text: 'いいえ',
                isColorReversed: true,
              ),
            ),
            WidthMargin.small,
            Expanded(
              child: CustomButton(
                onPressed: () {
                  onPressed();
                },
                text: 'OK',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
