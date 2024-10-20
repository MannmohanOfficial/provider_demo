import 'package:flutter/material.dart';

class UniversalProvider extends ChangeNotifier {
  bool _isVisible = true;

  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
  }

  void setVisibility() {
    print("Tapped");
    if (isVisible) {
      print("Enter if $isVisible");
      isVisible = false;
    } else {
      print("Enter else $isVisible");
      isVisible = true;
    }
    notifyListeners();
  }
}
