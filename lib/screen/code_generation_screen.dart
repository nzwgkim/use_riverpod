import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/layout/default_layout.dart';
import 'package:use_riverpod/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final autoDisposeState = ref.watch(gStateFutureProvider);
    final keepAliveState = ref.watch(gStateFuture2Provider);
    final codeGenerationFamilyState =
        ref.watch(gFamilyStateProvider(number1: 3, number2: 7));

    return DefaultLayout(
        title: 'CodeGenerationScreen',
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('state1:$state1'),
              Text('autoDisposeState:${autoDisposeState.value}'),
              autoDisposeState.when(
                data: (data) => Text(
                  'autoDisposeState:$data',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
                error: (err, stack) => Text('Error: $err'),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              keepAliveState.when(
                data: (data) => Text(
                  'keepAliveState:$data',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20),
                ),
                error: (err, stack) => Text('Error: $err'),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              Text('codeGenerationFamilyState:$codeGenerationFamilyState'),
            ],
          ),
        ));
  }
}
