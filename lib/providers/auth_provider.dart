import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';
import 'package:itrash_skripsi/services/auth_services.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  User? get user => _user;

  set user(User? user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      User user = await AuthServices().login(
        email: email,
        password: password,
      );
      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }
}
