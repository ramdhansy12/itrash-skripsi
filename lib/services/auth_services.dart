import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:itrash_skripsi/model/model.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  // String baseUrl = 'http://192.168.56.56/api';
  String baseUrl = 'https://itrash.technosolution.site/api';

  // register auth api
  Future<String> register({
    String? name,
    String? email,
    String? phone,
    String? password,
    String? alamat,
  }) async {
    var url = '$baseUrl/auth/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'handphone': phone,
      'password': password,
      'alamat': alamat,
    });

    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['message'];

      return data;
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

  Future<String> logout(String token) async {
    var url = '$baseUrl/auth/logout';
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var responses = await http.post(Uri.parse(url), headers: headers);

    if (responses.statusCode == 200) {
      var data = jsonDecode(responses.body)['message'];
      return data;
    } else {
      throw Exception("gagal logout");
    }
  }
}
