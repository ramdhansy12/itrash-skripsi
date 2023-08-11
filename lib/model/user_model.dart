part of 'models.dart';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? roles;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.roles,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    print('from json: $json');
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    roles = json['roles'];
  }
}
