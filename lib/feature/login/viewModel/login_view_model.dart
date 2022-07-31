import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool isCheckBoxOkey = false;
  String? _inputText;

  bool isLoading = false;

  void checkBoxChange(bool value) {
    isCheckBoxOkey = value;
    notifyListeners();
  }

  void _chamgeLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<bool> controlTextValue() async {
    _chamgeLoading();
    await Future.delayed(const Duration(seconds: 1));
    _chamgeLoading();
    return _inputText != null;
  }
}
