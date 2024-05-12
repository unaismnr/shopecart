import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopecart/views/common/bottom_navigation.dart';
import 'package:shopecart/views/login_and_registration/login_page.dart';
import 'package:shopecart/views/common/navigation_helper.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    checkUserLogin();
    super.initState();
  }

  Future<void> goToLogin() async {
    await Future.delayed(const Duration(seconds: 2), () {
      NavigationHelper.pushReplacement(
        context,
        LoginPage(),
      );
    });
  }

  Future<void> checkUserLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final userLoggedIn = prefs.getBool('isLoggedIn');
    if (userLoggedIn == null || userLoggedIn == false) {
      goToLogin();
    } else {
      if (mounted) {
        NavigationHelper.pushReplacement(
          context,
          const BottomNavigation(),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            "assets/Images/shop_ecart.png",
            width: 350,
            height: 250,
          ),
        ),
      ),
    );
  }
}
