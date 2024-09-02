import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_files/models/product.dart';

part 'cart_provider.g.dart';

class CartNotifier extends Notifier<Set<Product>> {
// initial value
  @override
  Set<Product> build() {
    return const {};
  }

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

@riverpod
int cartTotal(ref) {
  final cartProducts = ref.watch(cartNotifierProvider);
  int total = 0;
  for (Product product in cartProducts) {
    total += product.price;
  }
  return total;
}

// manual way of writing notifierProvider
final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});
