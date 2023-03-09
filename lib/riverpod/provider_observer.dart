import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  /// didUpdateProvider: 디버깅용으로도 훌륭하다.
  @override
  void didUpdateProvider(ProviderBase<Object?> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    print('didUpdateProvider: $provider, $previousValue/$newValue');
  }

  @override
  void didAddProvider(ProviderBase<Object?> provider, Object? value,
      ProviderContainer container) {
    print('didAddProvider: $provider, $value');
  }
}
