import 'package:flutter/material.dart';
import 'package:shopecart/models/wishlist_model.dart';

class WishlistProvider extends ChangeNotifier {
  final List<WishlistModel> _wishlist = [];

  List<WishlistModel> get getItems => _wishlist;

  void addItem(
    int id,
    String name,
    double price,
    int quantity,
    String image,
  ) {
    final product = WishlistModel(
      id: id,
      name: name,
      price: price,
      qty: quantity,
      image: image,
    );

    _wishlist.add(product);
    notifyListeners();
  }

  void removeItem(WishlistModel item) {
    _wishlist.remove(item);
    notifyListeners();
  }

  void clearWishlist() {
    _wishlist.clear();
    notifyListeners();
  }
}
