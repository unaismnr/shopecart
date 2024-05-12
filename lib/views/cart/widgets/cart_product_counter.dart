import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/utils/consts.dart';
import 'package:shopecart/controllers/cart_provider.dart';

class CartProductCounter extends StatelessWidget {
  final int index;
  const CartProductCounter({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cart, _) {
        int quantity = cart.getItems[index].qty;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildCounterIcon(
              Icons.remove,
              () {
                if (quantity > 1) {
                  cart.reduceProductCount(
                    cart.getItems[index],
                  );
                }
              },
              isEnabled: quantity != 1,
            ),
            Text(
              cart.getItems[index].qty.toString(),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            buildCounterIcon(
              Icons.add,
              () {
                cart.addProductCount(
                  cart.getItems[index],
                );
              },
              isEnabled: true,
            ),
          ],
        );
      },
    );
  }
}

Widget buildCounterIcon(IconData iconData, VoidCallback onTap,
    {bool isEnabled = true}) {
  return AnimatedOpacity(
    opacity: isEnabled ? 1 : 0.5,
    duration: const Duration(
      milliseconds: 200,
    ),
    child: InkWell(
      onTap: isEnabled ? onTap : null,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: mainColor,
        child: Padding(
          padding: const EdgeInsets.all(1.0),
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
