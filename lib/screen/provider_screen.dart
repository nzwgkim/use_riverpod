import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/layout/default_layout.dart';

import '../riverpod/provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);
    print('provder: $state');
    return DefaultLayout(title: 'ProviderScreen', body: ListView());
  }
}
