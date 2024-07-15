import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopecart/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopecart/views/common/bottom_navigation.dart';
import 'package:shopecart/views/common/navigation_helper.dart';

loginApi(String username, password, BuildContext context) async {
  final Map<String, dynamic> loginData = {
    "username": username,
    "password": password,
  };
  final response = await http.post(
    Uri.parse(
      '${apiMainUrl}login.php',
    ),
    body: loginData,
  );
  print(response.statusCode);
  if (response.statusCode == 200) {
    print(response.body);

    if (response.body.contains('success')) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString(
        'username',
        username.toString(),
      );
      if (context.mounted) {
        NavigationHelper.pushReplacement(
          context,
          const BottomNavigation(),
        );
      }
    } else {
      log('Login Failed');
    }
  }
}
