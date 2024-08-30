import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/products_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(reducedProductsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartProducts.map((product) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            product.image,
                            width: 50,
                            height: 50,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Text(
                            "£ ${product.price}",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          )
                        ],
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.8),
                      )
                    ],
                  ),
                );
              }).toList(), // output cart products here
            ),

            // output totals here
          ],
        ),
      ),
    );
  }
}
