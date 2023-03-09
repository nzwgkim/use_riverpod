import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/riverpod/state_notifier_provider.dart';

import '../model/shopping_item_model.dart';

final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>((ref) {
  final filterState = ref.watch(filterProvider);
  final shoppingListProvider = ref.watch(shoppingListNotifierProvider);

  if (filterState == FilterState.all) {
    return shoppingListProvider;
  }

  return shoppingListProvider
      .where((element) =>
          filterState == FilterState.spicy ? element.isSpicy : !element.isSpicy)
      .toList();
});

enum FilterState {
  notSpisy,
  spicy,
  all,
}

final filterProvider = StateProvider<Enum>((ref) {
  return FilterState.all;
});
