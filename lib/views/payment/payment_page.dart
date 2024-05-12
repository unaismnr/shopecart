import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shopecart/api/order_api.dart';
import '../../models/cart_product_model.dart';

class PaymentPage extends StatefulWidget {
  final String username;
  final String userRealName;
  final String address;
  final String phone;
  final double totalAmount;
  final String paymentMethod;
  final List<CartProductModel> items;
  final String date;
  const PaymentPage({
    super.key,
    required this.username,
    required this.userRealName,
    required this.address,
    required this.phone,
    required this.totalAmount,
    required this.paymentMethod,
    required this.items,
    required this.date,
  });

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Razorpay? _razorpay;

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay!.on(
      Razorpay.EVENT_PAYMENT_SUCCESS,
      _handlePaymentSuccess,
    );
    _razorpay!.on(
      Razorpay.EVENT_PAYMENT_ERROR,
      _handlePaymentError,
    );
    _razorpay!.on(
      Razorpay.EVENT_EXTERNAL_WALLET,
      _handleExternalWallet,
    );
    flutterPayment(
      'abcd',
      widget.totalAmount.toInt(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void flutterPayment(String orderId, int totalAmount) {
    String description = widget.items.map((item) => item.name).toString();
    var options = {
      'key': 'rzp_live_wlklx79ShXP3pw',
      'amount': totalAmount * 100,
      'name': 'Shopecart',
      'description': 'Pay for $description',
      'currency': 'INR',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@razorpay.com',
      }
    };
    try {
      _razorpay!.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void successMethod(String paymentId) {
    placeOrder(
      widget.items,
      widget.username,
      widget.userRealName,
      widget.address,
      widget.phone,
      widget.totalAmount.toString(),
      widget.date,
      widget.paymentMethod,
      context,
    );
  }

  void _handlePaymentSuccess(
    PaymentSuccessResponse response,
  ) {
    response.orderId;
    successMethod(
      response.paymentId.toString(),
    );
  }

  void _handlePaymentError(
    PaymentFailureResponse response,
  ) {
    log('Payment Failed');
  }

  void _handleExternalWallet(
    ExternalWalletResponse response,
  ) {
    log('Wallet');
  }
}
