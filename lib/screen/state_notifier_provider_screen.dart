import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/layout/default_layout.dart';
import 'package:use_riverpod/model/shopping_item_model.dart';
import 'package:use_riverpod/riverpod/state_notifier_provider.dart';

// 2. primitive가 아닐 경우
// final shoppingListNotifierProvider =
//     StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>((ref) {
//   return ShoppingListNotifier();
// });

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<ShoppingItemModel> shoppingList =
        ref.watch(shoppingListNotifierProvider);
    final shoppingNotifier = ref.watch(shoppingListNotifierProvider.notifier);

    return DefaultLayout(
      title: 'StateNotifierProvider',
      body: ListView(
        children: shoppingList
            .map(
              (e) => CheckboxListTile(
                value: e.hasBought,
                title: Text('${e.name}(${e.quantity})'),
                onChanged: (value) {
                  shoppingNotifier.toggleHasBrought(
                    name: e.name,
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
