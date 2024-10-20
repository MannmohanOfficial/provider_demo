import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider_demo/data/api_endpoint.dart';
import 'package:provider_demo/data/api_service.dart';
import 'package:provider_demo/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? profile;
  bool isLoading = false;

  Future<void> getUserProfile() async {
    isLoading = true;
    var result = await ApiService.instance.get(
      ApiEndpoints.getUsers+"/4"
    );

    
    profile = UserModel.fromJson(jsonDecode(result.responseBody));
    isLoading = false;
    notifyListeners();

  }


}