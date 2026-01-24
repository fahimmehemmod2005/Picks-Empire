import 'package:flutter/cupertino.dart';

class PaymentMethodViewModel extends ChangeNotifier{
  String? _selectedMethod;

  String? get selectedMethod => _selectedMethod;

  void selectMethod(String method) {
    _selectedMethod = method;
    notifyListeners();
  }
}