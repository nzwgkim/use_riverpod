import 'package:flutter_riverpod/flutter_riverpod.dart';

final multiplesFutureProvider = FutureProvider<List<int>>((ref) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );
  throw Exception('에러입니다.');
  return List<int>.generate(10, (index) => index);
});
