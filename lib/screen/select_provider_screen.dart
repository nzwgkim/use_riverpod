import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/layout/default_layout.dart';
import 'package:use_riverpod/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('build');
    final isSpy =
        ref.watch(selectNotifierProvider.select((value) => value.isSpicy));
    // final hasBought =
    //     ref.watch(selectNotifierProvider.select((value) => value.hasBought));

    final hasBought = ref
        .listen(selectNotifierProvider.select((value) => value.hasBought),
            (previous, next) {
      print('hasBought; $previous, $next');
    });
    final shoppingListNotifier = ref.watch(selectNotifierProvider.notifier);
    return DefaultLayout(
        title: 'SelectProviderScreen',
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('isSpy: $isSpy'),
              Text('hasBought: ${shoppingListNotifier.state.hasBought}'),
              ElevatedButton(
                onPressed: () => shoppingListNotifier.toggleIsSpcy(),
                child: const Text('Toggle Spy'),
              ),
              ElevatedButton(
                onPressed: () => shoppingListNotifier.toggleHasBought(),
                child: const Text('Toggle hasBought'),
              ),
            ],
          ),
        ));
  }
}
