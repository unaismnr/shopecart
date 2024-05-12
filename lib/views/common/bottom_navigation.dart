import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/views/home/home_page.dart';
import 'package:shopecart/views/order_details/order_details_page.dart';
import 'package:shopecart/views/panel/panel_page.dart';
import 'package:shopecart/controllers/bottom_navigation_provider.dart';
import '../wishlist/wishlist_page.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBarProvider =
        Provider.of<BottomNavigationBarProvider>(context);

    final pages = [
      const HomePage(),
      const WishlistPage(),
      const OrderDetailsPage(),
      const PanelPage(),
    ];

    return Scaffold(
      body: pages[bottomNavigationBarProvider.currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: bottomNavigationBarProvider.currentIndex,
        onDestinationSelected: (index) =>
            bottomNavigationBarProvider.updateBottomNavigationIndex(index),
        backgroundColor: Colors.white,
        indicatorColor: const Color.fromARGB(255, 239, 248, 255),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          NavigationDestination(
            icon: Icon(Icons.view_list_outlined),
            selectedIcon: Icon(Icons.view_list),
            label: 'Orders',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Panel',
          ),
        ],
      ),
    );
  }
}
