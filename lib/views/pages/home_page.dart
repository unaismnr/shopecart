import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/views/pages/all_products_page.dart';
import 'package:shopecart/views/pages/cart_page.dart';
import 'package:shopecart/views/pages/categories_page.dart';
import 'package:shopecart/views/pages/my_account.dart';
import 'package:shopecart/controllers/search_provider.dart';
import 'package:shopecart/views/widgets/home_category_box.dart';
import 'package:shopecart/views/widgets/home_app_bar_icons.dart';
import 'package:shopecart/views/widgets/home_banner_slider.dart';
import 'package:shopecart/views/widgets/home_products.dart';
import 'package:shopecart/views/widgets/home_sub_head_see_all.dart';
import 'package:shopecart/views/widgets/navigation_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customHomeAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            children: [
              HomeBannerSlider(),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    HomeSubHeadAndSeeAll(
                      title: 'All Categories',
                      onTap: () {
                        NavigationHelper.push(
                          context,
                          CategoriesPage(),
                        );
                      },
                    ),
                    HomeCategoryBox(),
                    HomeSubHeadAndSeeAll(
                      title: 'Browse Products',
                      onTap: () async {
                        await Navigator.push(
                          context,
                          PageTransition(
                            child: const AllProductsPage(),
                            type: PageTransitionType.rightToLeft,
                            duration: const Duration(milliseconds: 1),
                          ),
                        ).then(
                          (value) => Provider.of<SearchProvider>(context,
                                  listen: false)
                              .searchProducts(""),
                        );
                      },
                    ),
                    const HomeProducts(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar customHomeAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          Image.asset(
            'assets/Images/shopp-ecart.png',
            width: 130,
          ),
          const Spacer(),
          HomeAppBarIcons(
            icon: Icons.person_2_outlined,
            onTap: () {
              NavigationHelper.push(
                context,
                const MyAccount(),
              );
            },
          ),
          const SizedBox(
            width: 6,
          ),
          HomeAppBarIcons(
            icon: Icons.shopping_bag_outlined,
            onTap: () {
              NavigationHelper.push(
                context,
                const CartPage(),
              );
            },
          ),
        ],
      ),
    );
  }
}
