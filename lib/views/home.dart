import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_workshop_getx/controllers/cart_controller.dart';
import 'package:flutter_workshop_getx/views/checkout.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/shopping_cart.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ShoppingCart cart = Get.put(ShoppingCart());
    CartController cartController = Get.put(CartController());
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: GetX<CartController>(builder: (cart) {
                return Row(
                  children: [
                    Text('Total Items: ${cart.totalItems}'),
                    const SizedBox(
                      width: 20,
                    ),
                    Text('Total Price: ${cart.totalPrice}'),
                  ],
                );
              }),
            )
          ],
        ),
        body: GetX<ShoppingCart>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: cart.product.length,
                    itemBuilder: (_, i) {
                      return Card(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.product[i].name),
                                Text(controller.product[i].desc)
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Text('\$ ${controller.product[i].price}'),
                                ElevatedButton(
                                    onPressed: () => cartController
                                        .addToCart(controller.product[i]),
                                    child: const Text('Add to cart'))
                              ],
                            )
                          ],
                        ),
                      ));
                    }),
                ElevatedButton(
                    onPressed: () => cartController.clearCart(),
                    child: const Text('Clear cart')),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const CheckOut()));
                    },
                    child: const Text('CheckOut Screen'))
              ],
            ),
          );
        }));
  }
}
