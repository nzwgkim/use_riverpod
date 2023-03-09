// ignore_for_file: public_member_api_docs, sort_constructors_first
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

/// 2) parameter > Family parameter를 일반함수처럼 사용
///

/// Code generation을 사용하지 않은 family
class Parameter {
  final int number1;
  final int number2;
  Parameter({
    required this.number1,
    required this.number2,
  });
}

final _testFamilyProvider = Provider.family<int, Parameter>((ref, parameter) {
  return parameter.number1 * parameter.number2;
});

/// Code generation을 사용한 family
@riverpod
int gFamilyState(GFamilyStateRef ref,
    {required int number1, required int number2}) {
  return number1 * number2;
}

/// Riverpod v2 StateNotifierProvider 코드제너레이션으로 생성하기
/// snippet: riverpod class
@riverpod
class GStateNotifier extends _$GStateNotifier {
  @override
  build() {
    return 77; // 초기값 지정
  }

  increase() {
    // state: 내부에서 미리 정의되어진 변수이다.
    state++;
  }

  decrease() {
    state--;
  }
}
