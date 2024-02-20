import 'package:flutter/material.dart';

class RadioTileProvider extends ChangeNotifier {
  int _selectedValue = 1;
  String _paymentMethod = 'Cash on Delivery';

  int get selectedValue => _selectedValue;
  String get paymentMethod => _paymentMethod;

  void setSelectedValue(int value) {
    _selectedValue = value;
    if (value == 1) {
      _paymentMethod = 'Cash on Delivery';
    } else {
      _paymentMethod = 'Online Payment';
    }
    notifyListeners();
  }
}
