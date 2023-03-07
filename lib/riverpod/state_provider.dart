import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1. 가장 단순한 형태

final numberProvider = StateProvider<int>((ref) {
  return 0;
});
