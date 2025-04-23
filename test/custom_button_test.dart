import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_repositories/common_widget/custom_button.dart';

void main() {
  group('CustomButton', () {
    testWidgets('テキストが正しく表示される', (WidgetTester tester) async {
      // テスト用ボタンを作成
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: CustomButton(text: 'テストボタン', onPressed: () {})),
        ),
      );

      // テキストが正しく表示されているか確認
      expect(find.text('テストボタン'), findsOneWidget);
    });

    testWidgets('タップイベントが正しく発火する', (WidgetTester tester) async {
      // タップイベントのカウンター
      int tapCount = 0;

      // テスト用ボタンを作成
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'テストボタン',
              onPressed: () {
                tapCount++;
              },
            ),
          ),
        ),
      );

      // ボタンをタップ
      await tester.tap(find.byType(ElevatedButton));

      // tapCountが増加しているか確認
      expect(tapCount, 1);
    });

    testWidgets('色が反転するオプションが機能する', (WidgetTester tester) async {
      // 通常の色（反転なし）のボタンを作成
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: CustomButton(text: '通常ボタン', onPressed: () {})),
        ),
      );

      // テーマから期待される色を取得
      final BuildContext context = tester.element(find.text('通常ボタン'));
      final expectedBgColor = Theme.of(context).colorScheme.primary;
      final expectedTextColor = Theme.of(context).colorScheme.onPrimary;

      // 背景色とテキスト色をテーマの値と比較
      final button1 = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      final buttonStyle1 = button1.style as ButtonStyle;
      expect(buttonStyle1.backgroundColor?.resolve({}), expectedBgColor);

      final textWidget1 = tester.widget<Text>(find.text('通常ボタン'));
      expect(textWidget1.style?.color, expectedTextColor);

      // 色が反転したボタンを作成
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: '反転ボタン',
              onPressed: () {},
              isColorReversed: true,
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      // テーマから期待される色を取得（反転時）
      final BuildContext reversedContext = tester.element(find.text('反転ボタン'));
      final expectedReversedBgColor =
          Theme.of(reversedContext).colorScheme.secondary;
      final expectedReversedTextColor =
          Theme.of(reversedContext).colorScheme.onSecondary;

      // 反転時の背景色とテキスト色をテーマの値と比較
      final button2 = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      final buttonStyle2 = button2.style as ButtonStyle;
      expect(
        buttonStyle2.backgroundColor?.resolve({}),
        expectedReversedBgColor,
      );

      final textWidget2 = tester.widget<Text>(find.text('反転ボタン'));
      expect(textWidget2.style?.color, expectedReversedTextColor);
    });

    testWidgets('左側のアイコンが表示される', (WidgetTester tester) async {
      // アイコン付きのボタンを作成
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: 'アイコン付きボタン',
              onPressed: () {},
              leftIcon: Icons.search,
            ),
          ),
        ),
      );

      // アイコンが表示されているか確認
      expect(find.byIcon(Icons.search), findsOneWidget);
    });

    testWidgets('無効状態のボタンが正しく表示される', (WidgetTester tester) async {
      // 無効状態のボタンを作成
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomButton(
              text: '無効ボタン',
              onPressed: null, // nullを渡すと無効状態になる
            ),
          ),
        ),
      );

      // ボタンがタップ不可能であることを確認
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.onPressed, null);
    });
  });
}
