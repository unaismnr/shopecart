import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/utils/consts.dart';
import 'package:shopecart/views/pages/splash.dart';
import 'package:shopecart/controllers/bottom_navigation_provider.dart';
import 'package:shopecart/controllers/cart_provider.dart';
import 'package:shopecart/controllers/load_username_provider.dart';
import 'package:shopecart/controllers/radio_tile_provider.dart';
import 'package:shopecart/controllers/search_provider.dart';
import 'package:shopecart/controllers/wishlist_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BottomNavigationBarProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoadUsernameProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RadioTileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Shopecart',
        theme: ThemeData(
          primaryColor: mainColor,
          useMaterial3: false,
          textTheme: const TextTheme(
            labelSmall: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          fontFamily: 'Lato',
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashPage(),
      ),
    );
  }
}
