import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (dynamic _) => notifyListeners(),
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

// Riverpodプロバイダーの変更をStreamに変換するための拡張関数
extension ProviderStreamExtension on ProviderContainer {
  Stream<T> streamProvider<T>(ProviderListenable<T> provider) {
    final controller = StreamController<T>.broadcast();

    final sub = listen<T>(
      provider,
      (_, value) => controller.add(value),
      fireImmediately: true,
    );

    controller.onCancel = () {
      sub.close();
      controller.close();
    };

    return controller.stream;
  }
}
