import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/layout/default_layout.dart';
import 'package:use_riverpod/riverpod/state_provider.dart';

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int value = ref.watch(numberProvider);
    return DefaultLayout(
        title: 'StateProviderScreen',
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
