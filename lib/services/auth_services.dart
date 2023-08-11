import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  String baseUrl = 'https://itrash.technosolution.site/api';

  Future<User> register({
    String? name,
    String? email,
    String? phone,
    String? password,
  }) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      User user = User.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('gagal registrasi');
    }
  }

  // Login auth
  Future<User> login({
    String? email,
    String? password,
  }) async {
    var url = '$baseUrl/auth/login';
    var headers = {'Content-Type': 'application/json'};

    var body = jsonEncode({'email': email, 'password': password});

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    // print(response.statusCode);
    if (response.statusCode == 200) {
      var dataResponse = jsonDecode(response.body);

      User user = User.fromJson(dataResponse['user']);

      // ignore: prefer_interpolation_to_compose_strings
      user.token = 'Bearer ' + dataResponse['access_token'];

      return user;
    } else {
      throw Exception('gagal login');
    }
  }
}
