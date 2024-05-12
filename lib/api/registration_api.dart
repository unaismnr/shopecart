import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopecart/utils/consts.dart';
import 'package:shopecart/views/login_and_registration/login_page.dart';
import 'package:shopecart/views/common/navigation_helper.dart';

registrationApi(String name, phone, address, username, password,
    BuildContext context) async {
  final Map<String, dynamic> data = {
    "name": name,
    "phone": phone,
    "address": address,
    "username": username,
    "password": password,
  };
  final response = await http.post(
    Uri.parse('${apiMainUrl}registration.php'),
    body: data,
  );
  if (response.statusCode == 200) {
    if (response.body.contains('success')) {
      if (context.mounted) {
        NavigationHelper.pushReplacement(
          context,
          LoginPage(),
        );
      }
    } else {
      log('Registration Failed');
    }
  }
}
