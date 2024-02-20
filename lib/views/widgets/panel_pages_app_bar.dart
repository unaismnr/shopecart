import 'package:flutter/material.dart';

AppBar panelPagesAppBar(String title, context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
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
