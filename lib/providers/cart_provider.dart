import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
// initial value
  @override
  Set<Product> build() {
    return const {
      Product(
        id: "4",
        title: "Bed Backpack",
        price: 14,
        image: "assets/products/backpack.png",
      ),
    };
  }

// methods to update state

// add to cart
  void addProducts(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  // remove from cart
  void removeProducts(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});
