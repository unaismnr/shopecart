import 'package:flutter/material.dart';
import 'package:shopecart/models/cart_product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartProductModel> _list = [];
  List<CartProductModel> get getItems => _list;

  double get totalPrice {
    double total = 0.0;

    for (var item in _list) {
      total = total + (item.price * item.qty);
    }
    return total;
  }

  int get itemsCount {
    return _list.length;
  }

  void addItems(
    int id,
    String name,
    double price,
    int quantity,
    String image,
  ) {
    final product = CartProductModel(
      id: id,
      name: name,
      price: price,
      qty: quantity,
      image: image,
    );

    _list.add(product);
    notifyListeners();
  }

  void addProductCount(CartProductModel product) {
    product.increase();
    notifyListeners();
  }

  void reduceProductCount(CartProductModel product) {
    product.decrease();
    notifyListeners();
  }

  void removeCartItem(CartProductModel product) {
    _list.remove(product);
    notifyListeners();
  }
}
