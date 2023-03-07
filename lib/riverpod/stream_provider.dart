import 'package:flutter_riverpod/flutter_riverpod.dart';

final multipleStreamProvider = StreamProvider<List<int>>((ref) async* {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield List<int>.generate(3, (index) => i * index);
  }
});
