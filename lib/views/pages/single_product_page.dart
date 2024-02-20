import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/controllers/wishlist_provider.dart';
import 'package:shopecart/views/widgets/custom_app_bar.dart';
import 'package:shopecart/controllers/cart_provider.dart';

import '../widgets/custom_snackbar.dart';

class SingleProductPage extends StatelessWidget {
  final String productname;
  final int id;
  final double price;
  final String image;
  final String description;
  const SingleProductPage({
    super.key,
    required this.productname,
    required this.price,
    required this.image,
    required this.description,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    final wishlist = Provider.of<WishlistProvider>(context);
    final isInWishlist = wishlist.getItems.firstWhereOrNull(
      (element) => element.id == id,
    );
    return Scaffold(
      appBar: customAppBar(productname, context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Image.network(image),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color.fromARGB(255, 240, 247, 252),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          '₹${price.toString()}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 1,
                  left: 1,
                  child: IconButton(
                    onPressed: () {
                      if (isInWishlist != null) {
                        wishlist.removeItem(isInWishlist);
                      } else {
                        wishlist.addItem(id, productname, price, 1, image);
                      }
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: 35,
                      color:
                          isInWishlist != null ? Colors.blue : Colors.grey[350],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 240, 247, 252),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description.toString(),
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: showBottomSheet(
        context,
        productname,
        id,
        price,
        image,
      ),
    );
  }
}

showBottomSheet(
  BuildContext context,
  final String productname,
  int id,
  double price,
  String image,
) {
  return Container(
    height: MediaQuery.of(context).size.height / 11,
    width: MediaQuery.of(context).size.width,
    color: const Color.fromARGB(255, 221, 241, 255),
    child: Padding(
      padding: const EdgeInsets.only(
        left: 50,
        right: 50,
        top: 8,
        bottom: 8,
      ),
      child: ElevatedButton(
        onPressed: () {
          var existingItem = context
              .read<CartProvider>()
              .getItems
              .any((element) => element.id == id);
          if (existingItem) {
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar('Already Added', context),
            );
          } else {
            context
                .read<CartProvider>()
                .addItems(id, productname, price, 1, image);
            ScaffoldMessenger.of(context).showSnackBar(
              customSnackBar('Added To Cart', context),
            );
          }
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
  );
}
