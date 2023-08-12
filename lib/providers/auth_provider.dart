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

  Future<bool> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String alamat,
  }) async {
    try {
      await AuthServices().register(
        name: name,
        email: email,
        phone: phone,
        password: password,
        alamat: alamat,
      );

      return true;
    } catch (e) {
      // print(e);
      return false;
    }
  }

// Login auth provider
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

  Future<bool> submitLogout(String token) async {
    try {
      await AuthServices().logout(token);
      return true;
    } catch (e) {
      return false;
    }
  }
}
