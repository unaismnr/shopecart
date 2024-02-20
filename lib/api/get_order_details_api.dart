import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shopecart/utils/consts.dart';
import 'package:shopecart/models/order_details_model.dart';

Future<List<OrderDetailsModel>?> getOrderDetailsApi(String username) async {
  try {
    final response = await http.post(
        Uri.parse(
          '${apiMainUrl}get_orderdetails.php',
        ),
        body: {'username': username});
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      return parsed
          .map<OrderDetailsModel>((json) => OrderDetailsModel.fromJson(json))
          .toList();
    } else {
      throw Exception(
        'Failed to Load Order Details',
      );
    }
  } catch (e) {
    log('Issue: ${e.toString()}');
  }
  return null;
}
