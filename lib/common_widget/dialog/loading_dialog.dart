import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_repositories/config/routing/app_router.dart';
import 'package:search_repositories/config/util/custom_font_size.dart';
import 'package:search_repositories/config/util/custom_padding.dart';
import 'package:search_repositories/config/util/height_margin.dart';

void showLoadingDialog(String message) {
  showDialog(
    context: rootNavigatorKey.currentContext!,
    barrierDismissible: false,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(CustomPadding.normal),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CupertinoActivityIndicator(),
              HeightMargin.normal,
              Text(
                message,
                style: TextStyle(fontSize: CustomFontSize.normal),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    },
  );
}

void hideLoadingDialog() {
  if (rootNavigatorKey.currentState != null &&
      rootNavigatorKey.currentState!.canPop()) {
    rootNavigatorKey.currentState!.pop();
  }
}
