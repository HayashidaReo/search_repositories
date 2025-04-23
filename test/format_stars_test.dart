import 'package:flutter_test/flutter_test.dart';
import 'package:search_repositories/common_widget/icon_info_widget.dart';

void main() {
  group('formatStars関数のテスト', () {
    test('1000未満の数値はそのまま表示される', () {
      // 0のテスト
      expect(formatStars(0), '0');

      // 1桁の数値のテスト
      expect(formatStars(5), '5');

      // 2桁の数値のテスト
      expect(formatStars(42), '42');

      // 3桁の数値のテスト
      expect(formatStars(999), '999');
    });

    test('1000以上1,000,000未満の数値はK表記になる', () {
      // ちょうど1000のテスト
      expect(formatStars(1000), '1.00K');

      // 小数点以下2桁になるケース
      expect(formatStars(1512), '1.51K');

      // 1万のテスト
      expect(formatStars(12340), '12.3K');

      // 10万のテスト
      expect(formatStars(135700), '136K');

      // 100万未満の最大値
      expect(formatStars(999999), '1000K');
    });

    test('1,000,000以上1,000,000,000未満の数値はM表記になる', () {
      // ちょうど100万のテスト
      expect(formatStars(1000000), '1.00M');

      // 小数点以下2桁になるケース
      expect(formatStars(1530000), '1.53M');

      // 1000万のテスト
      expect(formatStars(10560000), '10.6M');

      // 1億のテスト
      expect(formatStars(100000000), '100M');

      // 10億未満の最大値
      expect(formatStars(999999999), '1000M');
    });

    test('1,000,000,000以上の数値はB表記になる', () {
      // ちょうど10億のテスト
      expect(formatStars(1351000000), '1.35B');

      // 小数点以下2桁になるケース
      expect(formatStars(1597000000), '1.60B');

      // 100億のテスト
      expect(formatStars(34630000000), '34.6B');

      // 1000億のテスト
      expect(formatStars(100000000000), '100B');
    });
  });
}
