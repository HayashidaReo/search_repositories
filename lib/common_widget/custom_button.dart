import 'package:flutter/material.dart';
import 'package:search_repositories/config/util/color_style.dart';
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
              !isColorReversed ? ColorStyle.darkBlack : ColorStyle.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: ColorStyle.darkBlack, width: 1),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (leftIcon != null)
                  ? Icon(
                    leftIcon,
                    color:
                        !isColorReversed ? ColorStyle.white : ColorStyle.black,
                  )
                  : SizedBox.shrink(),
              Padding(
                padding: const EdgeInsets.all(CustomPadding.smallest),
                child: Text(
                  text,
                  style: TextStyle(
                    color:
                        !isColorReversed ? ColorStyle.white : ColorStyle.black,
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
