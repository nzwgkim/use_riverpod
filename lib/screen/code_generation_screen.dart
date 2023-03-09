import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/layout/default_layout.dart';
import 'package:use_riverpod/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build...');
    final state1 = ref.watch(gStateProvider);
    final autoDisposeState = ref.watch(gStateFutureProvider);
    final keepAliveState = ref.watch(gStateFuture2Provider);
    final codeGenerationFamilyState =
        ref.watch(gFamilyStateProvider(number1: 3, number2: 7));

    // notifier를 watch한다. notifier에서 제공된, 초기화함수 build(), increase를 사용할 수 있다.
    // 하지만 build하지는 못한다.

    /// 헉... ref.watch(gStateNotifierProvider); 가 있어야 build 한다.

    final gstateProviderNotifier = ref.read(gStateNotifierProvider.notifier);
    // final gstateProvider = ref.watch(gStateNotifierProvider);

    // ref.watch(gStateNotifierProvider)은
    // ref.watch(gStateNotifierProvider.notifier).state와 같다.

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'state1:$state1',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'autoDisposeState:${autoDisposeState.value}',
              style: const TextStyle(fontSize: 20),
            ),
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
            Text(
              'codeGenerationFamilyState:$codeGenerationFamilyState',
              style: const TextStyle(fontSize: 20),
            ),
            // Text(
            //   'gstateNotifierProvider:${gstateProviderNotifier.state}',
            //   style: const TextStyle(fontSize: 20),
            // ),

            // const TestConsumer(),

            /// build를 부르는 것은 ref.watch(gStateNotifierProvider) 이다.
            /// 이게 Consumer안으로 집어넣으면, local하게 build된다.
            /// ref를 제공해 주는 widget이 consumer 밖에 없는 듯...
            ///
            Consumer(
              builder: (context, ref, child) {
                final gstateNotifierProvider =
                    ref.watch(gStateNotifierProvider);
                return Text('gstateNotifierProvider:$gstateNotifierProvider');
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => gstateProviderNotifier.increase(),
                    child: const Text('Increase')),
                ElevatedButton(
                    onPressed: () => gstateProviderNotifier.decrease(),
                    child: const Text('Decrease')),

                // invalidate...
                ElevatedButton(
                    onPressed: () => ref.invalidate(gStateNotifierProvider),
                    child: const Text('invalidate')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TestConsumer extends ConsumerWidget {
  const TestConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gstateProviderConsumer = ref.watch(gStateNotifierProvider);
    return Text(
      'gstateNotifierProvider:$gstateProviderConsumer',
      style: const TextStyle(fontSize: 20),
    );
  }
}
