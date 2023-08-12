part of 'models.dart';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? roles;
  String? token;
  String? address;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.roles,
    this.address,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    // print('from json: $json');
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['handphone'];
    password = json['password'];
    address = json['alamat'];
    roles = json['roles'];
    token = json['token'];
  }
}
