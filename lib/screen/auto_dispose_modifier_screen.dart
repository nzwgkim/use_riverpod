import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/layout/default_layout.dart';
import 'package:use_riverpod/riverpod/auto_dispose_modifier_provider.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifierProvider);

    return DefaultLayout(
      title: 'AutoDisposeModifierScreen',
      body: Center(
        child: state.when(
          data: (data) => Text(
            data.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),
          ),
          error: (err, stack) => Text('Error: $err'),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
