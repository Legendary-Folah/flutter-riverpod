import 'package:flutter/material.dart';
import 'package:riverpod_files/screens/cart/cart_screen.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return const CartScreen();
          },
        ));
      },
      icon: Badge.count(
        count: 9999,
        child: const Icon(
          Icons.notifications,
          color: Colors.grey,
          size: 26,
        ),
      ),
    );
  }
}

// Stack(
//       children: [
//         IconButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return const CartScreen();
//                 },
//               ),
//             );
//           },
//           icon: const Icon(
//             Icons.shopping_bag_outlined,
//             size: 30,
//           ),
//         ),
//         Positioned(
//           top: 5,
//           left: 5,
//           child: Container(
//             width: 18,
//             height: 18,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.redAccent,
//             ),
//             child: const Text(
//               "1",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 8,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
