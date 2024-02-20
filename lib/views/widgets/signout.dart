import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopecart/views/pages/login_page.dart';

signOut(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  if (context.mounted) {
    Navigator.pushAndRemoveUntil(
        context,
        PageTransition(
          child: LoginPage(),
          type: PageTransitionType.rightToLeft,
          duration: const Duration(milliseconds: 1),
        ),
        (route) => false);
  }
}
