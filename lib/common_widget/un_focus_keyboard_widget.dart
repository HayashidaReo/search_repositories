import 'package:flutter/material.dart';

/// キーボード以外の場所をタップすると、キーボードを閉じるウィジェット
class UnFocusKeyBoardWidget extends StatelessWidget {
  const UnFocusKeyBoardWidget({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboard(context);
      },
      child: child,
    );
  }
}

void hideKeyboard(BuildContext context) {
  // 現在のフォーカス情報を取得
  final FocusScopeNode currentScope = FocusScope.of(context);
  // hasPrimaryFocusがfalseで、かつhasFocusがtrueであれば、現在何らかのウィジェットがフォーカスを持っていると判定
  if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
    // TextFieldなどに設定されているフォーカスが解除され、キーボードが閉じる
    currentScope.unfocus();
  }
}
