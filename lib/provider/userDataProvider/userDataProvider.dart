import 'dart:developer';
import 'package:appscrip/models/userModel.dart';
import 'package:appscrip/provider/userDataProvider/userService.dart';
import 'package:flutter/material.dart';

class UserDataProvider extends ChangeNotifier {
  bool isLoading = true;
  List<UserModel> userList = [];
  List<UserModel> filteredUserList = [];

  UserDataProvider() {
    fetchUserList();
  }

  Future<void> fetchUserList() async {
    isLoading = true;
    notifyListeners();

    try {
      userList = await UserService().getAll(); 
      filteredUserList = List.from(userList);
    } catch (e) {
      log('Error fetching user list: $e');
      userList = [];
      filteredUserList = [];
    }

    isLoading = false;
    notifyListeners();
  }

  void filterUsers(String query) {
    if (query.isEmpty) {
      filteredUserList = List.from(userList);
    } else {
      filteredUserList = userList
          .where((user) =>
              (user.name ?? '').toLowerCase().contains(query.toLowerCase()) ||
              (user.email ?? '').toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
