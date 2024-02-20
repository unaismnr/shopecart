import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/views/pages/cart_page.dart';
import 'package:shopecart/controllers/cart_provider.dart';
import 'package:shopecart/controllers/wishlist_provider.dart';
import 'package:shopecart/views/widgets/custom_app_bar.dart';
import 'package:shopecart/views/widgets/navigation_helper.dart';

import '../widgets/custom_snackbar.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Wishlist', context),
      body: context.watch<WishlistProvider>().getItems.isEmpty
          ? const Center(
              child: Text('Empty'),
            )
          : Consumer<WishlistProvider>(
              builder: (context, list, _) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                          itemCount: list.getItems.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
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
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 95,
                                    child: Stack(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 90,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  list.getItems[index].image,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            Flexible(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    list.getItems[index].name,
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Text(
                                                    list.getItems[index].price
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.blue),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Positioned(
                                          right: 5,
                                          top: 10,
                                          bottom: 10,
                                          child: IconButton(
                                            onPressed: () {
                                              list.removeItem(
                                                list.getItems[index],
                                              );
                                            },
                                            icon: const Icon(
                                              Icons.delete_outline,
                                            ),
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
                      width: MediaQuery.of(context).size.width,
                      color: const Color.fromARGB(255, 224, 240, 252),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 50,
                          right: 50,
                          top: 8,
                          bottom: 8,
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            WishlistProvider wishlist =
                                context.read<WishlistProvider>();
                            CartProvider cartlist =
                                context.read<CartProvider>();

                            for (var item in wishlist.getItems) {
                              final alreadyInCart = cartlist.getItems.any(
                                (element) => element.id == item.id,
                              );

                              if (!alreadyInCart) {
                                cartlist.addItems(
                                  item.id,
                                  item.name,
                                  item.price,
                                  item.qty,
                                  item.image,
                                );
                              }
                            }
                            NavigationHelper.push(
                              context,
                              const CartPage(),
                            );
                            list.clearWishlist();
                            ScaffoldMessenger.of(context).showSnackBar(
                              customSnackBar(
                                "Added to Cart",
                                context,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('ADD TO CART'),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
    );
  }
}
