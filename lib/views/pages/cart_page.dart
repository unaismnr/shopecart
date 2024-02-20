import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/utils/consts.dart';
import 'package:shopecart/views/pages/checkout_page.dart';
import 'package:shopecart/views/widgets/cart_product_counter.dart';
import 'package:shopecart/views/widgets/custom_app_bar.dart';
import 'package:shopecart/controllers/cart_provider.dart';
import 'package:shopecart/views/widgets/navigation_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        'Cart',
        context,
      ),
      body: context.watch<CartProvider>().getItems.isEmpty
          ? const Center(
              child: Text('Empty'),
            )
          : Consumer<CartProvider>(builder: (context, cart, _) {
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: cart.itemsCount,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 235, 235, 235),
                                    spreadRadius: .1,
                                    blurRadius: 10,
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              child: SizedBox(
                                height: 110,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, top: 8, bottom: 8),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: SizedBox(
                                          width: 90,
                                          child: Center(
                                            child: Image.network(
                                              cart.getItems[index].image,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    cart.getItems[index].name,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                const SizedBox(width: 30),
                                                IconButton(
                                                  onPressed: () {
                                                    cart.removeCartItem(
                                                      cart.getItems[index],
                                                    );
                                                  },
                                                  icon: const Icon(
                                                      Icons.delete_outline),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  '₹${cart.getItems[index].price}'
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: mainColor),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 10),
                                                  child: CartProductCounter(
                                                      index: index),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 11,
                    color: const Color.fromARGB(255, 224, 240, 252),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                        right: 25,
                        bottom: 11,
                        top: 11,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                '₹${cart.totalPrice.toString()}',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              NavigationHelper.push(
                                context,
                                CheckoutPage(
                                  cartList: cart.getItems,
                                  totalPrice: cart.totalPrice,
                                ),
                              );
                            },
                            child: Container(
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              child: const Center(
                                child: Text(
                                  "Check Out",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
    );
  }
}
