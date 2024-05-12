import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopecart/controllers/bottom_navigation_provider.dart';

AppBar customAppBar(String title, context) {
  var bottomNavigationBarProvider =
      Provider.of<BottomNavigationBarProvider>(context);
  return AppBar(
    leading: IconButton(
      onPressed: () {
        bottomNavigationBarProvider.currentIndex != 0
            ? bottomNavigationBarProvider.updateBottomNavigationIndex(0)
            : Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back_ios_new_outlined,
        color: Colors.black,
        size: 20,
      ),
    ),
    title: Text(
      title,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.white,
  );
}
