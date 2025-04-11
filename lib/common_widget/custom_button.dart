import 'package:flutter/material.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/custom_padding.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isColorReversed = false,
    this.leftIcon,
  });

  final String text;
  final VoidCallback? onPressed;
  final bool isColorReversed;
  final IconData? leftIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              !isColorReversed
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color:
                  !isColorReversed
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.onSecondary,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(CustomPadding.smallest),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (leftIcon != null)
                  ? Icon(
                    leftIcon,
                    color:
                        !isColorReversed
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSecondary,
                  )
                  : const SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.all(CustomPadding.smallest),
                child: Text(
                  text,
                  style: TextStyle(
                    color:
                        !isColorReversed
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.onSecondary,
                    fontWeight: (!isColorReversed) ? FontWeight.bold : null,
                    fontSize: CustomFontSize.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
