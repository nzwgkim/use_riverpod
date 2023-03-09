import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/shopping_item_model.dart';

// 2. primitive가 아닐 경우

final shoppingListNotifierProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>((ref) {
  return ShoppingListNotifier();
});

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super(
          [
            const ShoppingItemModel(
              name: '김치',
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            const ShoppingItemModel(
              name: '라면',
              quantity: 5,
              hasBought: false,
              isSpicy: true,
            ),
            const ShoppingItemModel(
              name: '불닭소스',
              quantity: 1,
              hasBought: false,
              isSpicy: true,
            ),
            const ShoppingItemModel(
              name: '삼겹살',
              quantity: 10,
              hasBought: false,
              isSpicy: false,
            ),
            const ShoppingItemModel(
              name: '수박',
              quantity: 2,
              hasBought: false,
              isSpicy: false,
            ),
            const ShoppingItemModel(
              name: '카스테라',
              quantity: 5,
              hasBought: false,
              isSpicy: false,
            ),
          ],
        );
  void toggleHasBought({required String name}) {
    state = state
        .map(
          (e) => e.name == name ? e.copyWith(hasBought: !e.hasBought) : e,
        )
        .toList();
  }
}
