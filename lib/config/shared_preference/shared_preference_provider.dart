import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preference_provider.g.dart';

/// SharedPreferencesのインスタンスを生成
@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(ref) async {
  return SharedPreferences.getInstance();
}
