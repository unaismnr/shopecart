import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/api/get_user_api.dart';
import 'package:shopecart/views/pages/cart_page.dart';
import 'package:shopecart/views/pages/order_details_page.dart';
import 'package:shopecart/views/pages/wishlist_page.dart';
import 'package:shopecart/controllers/load_username_provider.dart';
import 'package:shopecart/views/widgets/custom_app_bar.dart';
import 'package:shopecart/views/widgets/navigation_helper.dart';
import 'package:shopecart/views/widgets/panel_custom_button.dart';
import 'package:shopecart/views/widgets/signout.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        'My Account',
        context,
      ),
      body: Consumer<LoadUsernameProvider>(
        builder: (context, user, _) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder(
                  future: getUserApi(user.username.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          const SizedBox(height: 5),
                          customContainer(
                            context,
                            Column(
                              children: [
                                PanelCustomButton(
                                  icon: Icons.person_2_outlined,
                                  text: snapshot.data!.name,
                                ),
                                const Divider(),
                                PanelCustomButton(
                                  icon: Icons.house_outlined,
                                  text: snapshot.data!.address,
                                ),
                                const Divider(),
                                PanelCustomButton(
                                  icon: Icons.phone_outlined,
                                  text: snapshot.data!.phone,
                                  onTap: () {},
                                ),
                                const Divider(),
                                PanelCustomButton(
                                  icon: Icons.shopping_bag_outlined,
                                  text: 'Cart',
                                  onTap: () {
                                    NavigationHelper.push(
                                      context,
                                      const CartPage(),
                                    );
                                  },
                                ),
                                const Divider(),
                                PanelCustomButton(
                                  icon: Icons.view_list_outlined,
                                  text: 'Orders',
                                  onTap: () {
                                    NavigationHelper.push(
                                      context,
                                      const OrderDetailsPage(),
                                    );
                                  },
                                ),
                                const Divider(),
                                PanelCustomButton(
                                  icon: Icons.favorite_outline,
                                  text: 'Wishlist',
                                  onTap: () {
                                    NavigationHelper.push(
                                      context,
                                      const WishlistPage(),
                                    );
                                  },
                                ),
                                const Divider(),
                                PanelCustomButton(
                                  icon: Icons.power_settings_new,
                                  text: 'Logout',
                                  onTap: () {
                                    signOut(context);
                                  },
                                ),
                              ],
                            ),
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

Widget customContainer(
  BuildContext context,
  Widget button,
) {
  return Container(
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
    child: button,
  );
}
