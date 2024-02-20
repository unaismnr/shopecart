import 'package:flutter/material.dart';
import 'package:shopecart/models/product_model.dart';
import 'package:shopecart/api/get_products_api.dart';

class SearchProvider extends ChangeNotifier {
  List<ProductModel>? _allProducts;
  List<ProductModel>? _displayedProducts;

  List<ProductModel>? get displayedProducts => _displayedProducts;

  SearchProvider() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    _allProducts = await getProductsApi();
    _displayedProducts = _allProducts;
    notifyListeners();
  }

  void searchProducts(String query) {
    if (query.isEmpty) {
      _displayedProducts = _allProducts;
    } else {
      _displayedProducts = _allProducts!
          .where((product) => product.productname!.toLowerCase().contains(
                query.toLowerCase(),
              ))
          .toList();
    }
    notifyListeners();
  }
}
