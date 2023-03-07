import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 해당 screen을 떠나면, 데이터를 삭제한다.
/// 즉, screen으로 올때마다, 데이터를 새로 만든다.
///
final autoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(
    const Duration(seconds: 3),
  );

  return List<int>.generate(10, (index) => index);
});
