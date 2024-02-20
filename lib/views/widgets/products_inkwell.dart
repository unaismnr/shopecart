import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/utils/consts.dart';
import 'package:shopecart/models/product_model.dart';
import 'package:shopecart/controllers/wishlist_provider.dart';
import 'package:collection/collection.dart';
import 'package:shopecart/views/widgets/navigation_helper.dart';
import '../pages/single_product_page.dart';

class ProductsInkwell extends StatelessWidget {
  final ProductModel product;
  const ProductsInkwell({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final isInWishlist = wishlistProvider.getItems.firstWhereOrNull(
      (element) => element.id == product.id,
    );
    return InkWell(
      onTap: () {
        NavigationHelper.push(
          context,
          SingleProductPage(
            productname: product.productname.toString(),
            id: product.id!,
            price: product.price!,
            image: imageurl + product.image.toString(),
            description: product.description.toString(),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
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
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.network(
                    imageurl + product.image.toString(),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          product.productname.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          '₹${product.price.toString()}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 1,
            right: 1,
            child: IconButton(
              onPressed: () {
                if (isInWishlist != null) {
                  wishlistProvider.removeItem(isInWishlist);
                } else {
                  wishlistProvider.addItem(
                    product.id!,
                    product.productname.toString(),
                    product.price!,
                    1,
                    imageurl + product.image.toString(),
                  );
                }
              },
              icon: Icon(
                Icons.favorite,
                color: isInWishlist != null ? Colors.blue : Colors.grey[350],
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
