import 'package:flutter_workshop_getx/models/products.dart';
import 'package:get/get.dart';

class ShoppingCart extends GetxController {
  final product = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  void getData() async {
    await Future.delayed(const Duration(seconds: 1));
    var res = [
      Product(
          desc:
              'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua',
          name: 'Rice',
          price: 100),
      Product(
          desc: 'cididunt ut labore et dolore magna aliqua',
          name: 'Beans',
          price: 80),
      Product(
          desc: 'cididunt ut labore et dolore magna aliqua',
          name: 'Tomatoe',
          price: 60),
      Product(
          desc: ' eiusmod tempor incididunt ut labore et dolore magna aliqua',
          name: 'Orange',
          price: 40),
    ];
    product.value = res;
  }
}
