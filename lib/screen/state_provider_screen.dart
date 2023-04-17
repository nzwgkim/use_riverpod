import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/layout/default_layout.dart';
import 'package:use_riverpod/riverpod/state_provider.dart';

// 1. 가장 단순한 형태

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int state = ref.watch(numberProvider);
    return DefaultLayout(
        title: 'StateProviderScreen',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              ElevatedButton(
                  onPressed: () => ref
                      .read(numberProvider.notifier)
                      .update((state) => ++state),
                  child: const Text('Up')),
              ElevatedButton(
                  onPressed: () => --ref.read(numberProvider.notifier).state,
                  // () => ref.read(numberProvider.notifier).state =
                  //     ref.read(numberProvider.notifier).state - 1,
                  // () => ref
                  //     .read(numberProvider.notifier)
                  //     .update((state) => --state),
                  child: const Text('Down')),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const _NextPage(),
                      )),
                  child: const Text('Next Page')),
            ],
          ),
        ));
  }
}

class _NextPage extends ConsumerWidget {
  const _NextPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int value = ref.watch(numberProvider);
    return DefaultLayout(
        title: 'Next Page',
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value.toString(),
                style: const TextStyle(fontSize: 30),
              ),
              ElevatedButton(
                  onPressed: () => ref
                      .read(numberProvider.notifier)
                      .update((state) => ++state),
                  child: const Text('Up')),
            ],
          ),
        ));
  }
}
