/// 星の数をフォーマットする関数
/// 丸めた値は３桁で表示する
String formatStars(int stars) {
  // 1000未満ならそのまま文字列に変換して返す
  if (stars < 1000) {
    return stars.toString();
  }

  String suffix;
  double value;

  // 1000〜999,999の場合はK表記
  if (stars < 1000000) {
    suffix = 'K';
    value = stars / 1000;
  }
  // 1,000,000〜999,999,999の場合はM表記
  else if (stars < 1000000000) {
    suffix = 'M';
    value = stars / 1000000;
  }
  // それ以上はB表記
  else {
    suffix = 'B';
    value = stars / 1000000000;
  }

  /// 整数部の桁数により小数点以下の桁数を決定する
  /// 例:
  /// 1.xxxなら3 - 1 = 2桁
  /// 11.xxxなら3 - 2 = 1桁
  int integerDigits = value.floor().toString().length;
  int decimals = integerDigits >= 3 ? 0 : 3 - integerDigits;

  // 指定した小数点以下の桁数で四捨五入して文字列に変換
  String formatted = value.toStringAsFixed(decimals);

  return '$formatted$suffix';
}
