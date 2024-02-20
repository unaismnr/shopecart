import 'dart:convert';
import 'dart:developer';

import 'package:shopecart/utils/consts.dart';
import 'package:shopecart/models/category_model.dart';
import 'package:http/http.dart' as http;

Future<List<CategoryModel>?> getCategoriesApi() async {
  try {
    final response = await http.get(
      Uri.parse(
        '${apiMainUrl}getcategories.php',
      ),
    );

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body);

      return parsed
          .map<CategoryModel>((json) => CategoryModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Categories does not load');
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}
