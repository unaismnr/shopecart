import 'package:flutter/material.dart';

SnackBar customSnackBar(String text, BuildContext context) {
  return SnackBar(
    backgroundColor: Colors.blue,
    duration: const Duration(seconds: 1),
    content: Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 17),
      ),
    ),
  );
}
