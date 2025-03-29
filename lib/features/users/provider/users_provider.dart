import 'package:flutter/material.dart';
import 'package:user_manage_app/core/models/user_model.dart';
import 'package:user_manage_app/core/services/api_services.dart';

class Notifier extends ChangeNotifier {
  List<UserModel> _users = []; // storig all users in app
  List<UserModel> _filteredUsers = []; // storing only search users
  bool _isLoading = false;

  List<UserModel> get user => _filteredUsers;
  bool get isLoading => _isLoading;

// to load user from api
  Future<void> loadUsers() async {
    _isLoading = true;
    notifyListeners();
    try {
      _users = await Api().fetchUsers();
      _filteredUsers = _users;
    } catch (e) {
      print("Error: $e");
    }
    _isLoading = false;
    notifyListeners();
  }

  // search users
  void searchUser(String query) {
    if (query.isEmpty) {
      _filteredUsers = _users;
    } else {
      _filteredUsers = _users
          .where((user) =>
              user.firstName.toLowerCase().contains(query.toLowerCase()) ||
              user.firstName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  //add users
  void addUsers(UserModel user) {
    _users.add(user);
    _filteredUsers = _users;
    notifyListeners();
  }

  //updated users
  void updateUsers(int id, UserModel updatedUsers) {
    int index = _users.indexWhere((user) => user.id == id);
    if (index != -1) {
      _users[index] = updatedUsers;
      _filteredUsers = _users;
      notifyListeners();
    }
  }

  //delete the users
  void deleteUser(int id) {
    _users.removeWhere((user) => user.id == id);
    _filteredUsers = _users;
    notifyListeners();
  }
}
