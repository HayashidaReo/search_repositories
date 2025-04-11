import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'secure_storage_controller.g.dart';

@riverpod
class SecureStorageController extends _$SecureStorageController {
  @override
  FlutterSecureStorage build() {
    return const FlutterSecureStorage();
  }

  Future<void> setValue({required String key, required String value}) async {
    await state.write(key: key, value: value);
  }

  Future<String?> getValue({required String key}) async {
    return await state.read(key: key);
  }

  Future<void> deleteValue({required String key}) async {
    await state.delete(key: key);
  }
}
