import 'package:flutter/material.dart';

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
