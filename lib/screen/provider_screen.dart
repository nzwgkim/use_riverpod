import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/layout/default_layout.dart';
import 'package:use_riverpod/riverpod/state_notifier_provider.dart';

import '../riverpod/provider.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingItemModelList = ref.watch(filteredShoppingListProvider);
    print('provder: $shoppingItemModelList');

    return DefaultLayout(
        title: 'ProviderScreen',
        actions: [
          PopupMenuButton<Enum>(
            onSelected: (value) {
              ref.read(filterProvider.notifier).update((state) => value);
            },
            itemBuilder: (context) => FilterState.values
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    child: Text(e.name),
                  ),
                )
                .toList(),
          )
        ],
        body: ListView(
          children: shoppingItemModelList
              .map(
                (e) => CheckboxListTile(
                  value: e.hasBought,
                  title: Text('${e.name}(${e.quantity})'),
                  onChanged: (value) {
                    ref
                        .read(shoppingListNotifierProvider.notifier)
                        .toggleHasBought(
                          name: e.name,
                        );
                  },
                ),
              )
              .toList(),
        ));
  }
}
