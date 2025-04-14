import 'package:flutter/material.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';

InputDecoration noneBorderTextFieldDecoration({
  required String label,
  required VoidCallback? prefixIconOnPressed,
  required Widget prefixIcon,
  required VoidCallback? suffixIconOnPressed,
  required Widget suffixIcon,
  required BuildContext context,
}) {
  return InputDecoration(
    hintText: label,
    hintStyle: TextStyle(
      fontSize: CustomFontSize.normal,
      color: Theme.of(context).colorScheme.tertiary,
    ),
    prefixIcon: IconButton(onPressed: prefixIconOnPressed, icon: prefixIcon),
    suffixIcon: IconButton(onPressed: suffixIconOnPressed, icon: suffixIcon),
    filled: true,
    fillColor: Theme.of(context).colorScheme.primaryContainer,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(20),
    ),
    contentPadding: EdgeInsets.zero,
  );
}
