import 'package:flutter_riverpod/flutter_riverpod.dart';

final multiplesFutureProvider = FutureProvider<List<int>>((ref) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );
  return List<int>.generate(10, (index) => index);
});
