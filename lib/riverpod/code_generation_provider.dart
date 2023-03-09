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
