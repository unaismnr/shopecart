import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/utils/consts.dart';
import 'package:shopecart/models/cart_product_model.dart';
import 'package:http/http.dart' as http;
import 'package:shopecart/views/common/bottom_navigation.dart';
import 'package:shopecart/controllers/cart_provider.dart';
import 'package:shopecart/views/common/custom_snackbar.dart';

placeOrder(
  List<CartProductModel> cart,
  String username,
  String name,
  String address,
  String phone,
  String amount,
  String date,
  String paymentmethod,
  BuildContext context,
) async {
  String jsonData = jsonEncode(cart);

  final cartDetails = Provider.of<CartProvider>(context, listen: false);

  final response = await http.post(
      Uri.parse(
        '${apiMainUrl}order.php',
      ),
      body: {
        "username": username,
        "name": name,
        "address": address,
        "phone": phone,
        "amount": amount,
        "date": date,
        "paymentmethod": paymentmethod,
        "quantity": cartDetails.itemsCount.toString(),
        "cart": jsonData,
      });

  if (response.statusCode == 200) {
    if (response.body.contains('Success')) {
      cart.clear();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          customSnackBar('Your Order is Successful', context),
        );
      }

      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            PageTransition(
              child: const BottomNavigation(),
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 1),
            ),
            (route) => false);
      }
    }
  }
}
