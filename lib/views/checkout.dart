import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cart = Get.put(CartController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Items in your cart: '),
          ListView.builder(
              shrinkWrap: true,
              itemCount: cart.cartItems.length,
              itemBuilder: (_, i) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(cart.cartItems[i].name),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Obx(() => Text('\$${cart.cartItems[i].price.toString()}'))
                  ],
                );
              }),
          Obx(() => Text(
              'You Have ${cart.totalItems} item(s) amounting to \$${cart.totalPrice} in your cart'))
        ],
      ),
    );
  }
}
