import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:use_riverpod/model/shopping_item_model.dart';

final selectNotifierProvider =
    StateNotifierProvider<SelectNotifier, ShoppingItemModel>((ref) {
  return SelectNotifier();
});

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(const ShoppingItemModel(
            name: '스시', quantity: 5, hasBought: false, isSpicy: false));
  toggleHasBought() {
    state = state.copyWith(hasBought: !state.hasBought);
  }

  toggleIsSpcy() {
    state = state.copyWith(isSpicy: !state.isSpicy);
  }
}
