import 'package:flutter/material.dart';
import 'package:provider_demo/data/api_endpoint.dart';
import 'package:provider_demo/data/api_service.dart';

class AuthProvider extends ChangeNotifier {
  String _email = "";
  String _password = "";

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  void onChangeEmailText(value) {
    email = value;

    notifyListeners();
  }

  void onChangePasswordText(value) {
    password = value;

    notifyListeners();
  }

  Future<AppResponse> loginUser() async {
    return await ApiService.instance.post(
      ApiEndpoints.loginUrl,
        {
          "email": email,
          "password": password
        }
    );
  }

  Future<AppResponse> registerUser() async {
    return await ApiService.instance.post(
        ApiEndpoints.registerUrl,
        {
          "email": email,
          "password": password
        }
    );
  }
}
