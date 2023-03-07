import 'package:flutter_riverpod/flutter_riverpod.dart';

final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(
    const Duration(seconds: 3),
  );

  return List<int>.generate(10, (index) => index * data);
});
