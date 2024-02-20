import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/api/order_api.dart';
import 'package:shopecart/views/pages/payment_page.dart';
import 'package:shopecart/controllers/radio_tile_provider.dart';
import 'package:shopecart/views/widgets/navigation_helper.dart';
import '../../models/cart_product_model.dart';
import 'checkout_radio_tile.dart';

class CheckoutYourOrder extends StatelessWidget {
  final String username;
  final String userRealName;
  final String address;
  final String phone;
  final List<CartProductModel> cartList;
  final double totalPrice;

  const CheckoutYourOrder({
    super.key,
    required this.totalPrice,
    required this.cartList,
    required this.username,
    required this.address,
    required this.phone,
    required this.userRealName,
  });

  @override
  Widget build(BuildContext context) {
    String date = DateTime.now().toString();
    return Consumer<RadioTileProvider>(
      builder: (context, provider, _) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'YOUR ORDER',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'PRODUCT',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'SUBTOTAL',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Divider(
                  color: Colors.grey[350],
                  height: 1,
                  thickness: 2.5,
                ),
                const SizedBox(height: 10),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = cartList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            '${item.name} × ${item.qty}',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 30),
                        Text(
                          '${item.price * item.qty}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: ((context, index) => const Divider()),
                  itemCount: cartList.length,
                  shrinkWrap: true,
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.grey,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '$totalPrice',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey[350],
                  thickness: 2.5,
                  height: 1,
                ),
                const SizedBox(height: 10),
                CheckoutRadioTile(
                  value: 1,
                  groupValue: provider.selectedValue,
                  onChanged: (int? value) {
                    provider.setSelectedValue(value!);
                  },
                  title: 'Cash on Delivery',
                  subTitle: 'Pay Cash at Home',
                ),
                CheckoutRadioTile(
                  value: 2,
                  groupValue: provider.selectedValue,
                  onChanged: (int? value) {
                    provider.setSelectedValue(value!);
                  },
                  title: 'Pay Now',
                  subTitle: 'Online Payment',
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      String payMethod = provider.paymentMethod;
                      if (payMethod == 'Online Payment') {
                        NavigationHelper.push(
                          context,
                          PaymentPage(
                            username: username,
                            userRealName: userRealName,
                            address: address,
                            phone: phone,
                            totalAmount: totalPrice,
                            paymentMethod: payMethod,
                            items: cartList,
                            date: date,
                          ),
                        );
                      } else {
                        String date = DateTime.now().toString();
                        placeOrder(
                          cartList,
                          username,
                          userRealName,
                          address,
                          phone,
                          totalPrice.toString(),
                          date,
                          payMethod,
                          context,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    child: const Text(
                      'PLACE ORDER',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
