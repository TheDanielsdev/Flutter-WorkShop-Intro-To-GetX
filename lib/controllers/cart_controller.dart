import 'package:flutter_workshop_getx/models/products.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;

  int get totalPrice => cartItems.fold(
      0, (previousValue, element) => previousValue + element.price);

  int get totalItems => cartItems.length;

  void addToCart(Product prod) {
    cartItems.add(prod);
  }

  void clearCart() {
    cartItems.clear();
  }
}
