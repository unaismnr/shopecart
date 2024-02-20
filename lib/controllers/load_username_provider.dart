import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadUsernameProvider extends ChangeNotifier {
  LoadUsernameProvider() {
    loadUsername();
  }

  String? username;
  Future<String?> loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username');
    notifyListeners();
    return username;
  }
}
