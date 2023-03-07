import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/layout/default_layout.dart';
import 'package:use_riverpod/riverpod/family_modifier.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(familyModifierProvider(3));
    return DefaultLayout(
        title: 'FamilyModifier',
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
        ));
  }
}
