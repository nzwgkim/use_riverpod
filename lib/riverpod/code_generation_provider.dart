import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

/// ver1 --> ver 2
/// 1. 어떤 provider를 사용할지 고민할 필요없다.
/// provider, StateProvide, FutureProvider, StreamProvider
/// StateNofifierProvider
final _testProvider = Provider<String>((ref) {
  return '1Hello, Code Generation!';
});

/// Riverpod: simple instance
///
@riverpod
String gState(GStateRef ref) {
  return '2Hello, ';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(const Duration(seconds: 2));

  return 10;
}

@Riverpod(
  // 기본값은 false... 살려줘라
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(const Duration(seconds: 2));

  return 10;
}
