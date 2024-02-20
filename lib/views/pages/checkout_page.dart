import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/api/get_user_api.dart';
import 'package:shopecart/models/cart_product_model.dart';
import 'package:shopecart/views/widgets/custom_app_bar.dart';
import 'package:shopecart/controllers/load_username_provider.dart';
import '../widgets/checkout_your_order.dart';

class CheckoutPage extends StatelessWidget {
  final List<CartProductModel> cartList;
  final double totalPrice;
  final String? productName;
  const CheckoutPage({
    super.key,
    required this.cartList,
    required this.totalPrice,
    this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        'Checkout',
        context,
      ),
      body: Consumer<LoadUsernameProvider>(
        builder: (context, user, _) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder(
                  future: getUserApi(user.username.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'BILLING DETAILS',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          customDetailsText(snapshot.data!.name),
                          customDetailsText(snapshot.data!.phone),
                          customDetailsText(snapshot.data!.address),
                          const SizedBox(height: 10),
                          CheckoutYourOrder(
                            username: user.username.toString(),
                            userRealName: snapshot.data!.name,
                            address: snapshot.data!.address,
                            phone: snapshot.data!.phone,
                            cartList: cartList,
                            totalPrice: totalPrice,
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
          );
        },
      ),
    );
  }
}

Widget customDetailsText(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    ),
  );
}
