import 'dart:convert';
import 'dart:developer';

import 'package:shopecart/utils/consts.dart';
import 'package:shopecart/models/product_model.dart';
import 'package:http/http.dart' as http;

Future<List<ProductModel>?> getProductsApi() async {
  try {
    final response = await http.get(
      Uri.parse('${apiMainUrl}view_offerproducts.php'),
    );
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);
      return parsed
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to Load Products');
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}
