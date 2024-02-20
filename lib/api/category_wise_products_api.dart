import 'dart:convert';
import 'dart:developer';

import 'package:shopecart/utils/consts.dart';
import 'package:http/http.dart' as http;
import 'package:shopecart/models/product_model.dart';

Future<List<ProductModel>?> getCategoryWiseProductsApi(categoryId) async {
  try {
    final response = await http.post(
      Uri.parse('${apiMainUrl}get_category_products.php'),
      body: {'catid': categoryId},
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);

      return parsed
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed Get Category Wise Products');
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}
