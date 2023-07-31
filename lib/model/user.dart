part of 'model.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? roles;
  String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.roles,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json) {
    // print('from json: $json');

    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    roles = json['roles'];
    token = json['token'];
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'email': email,
  //     'roles': roles,
  //     'token': token,
  //   };
  // }
}

// User mockUser = User(
//   id: 1,
//   name: 'Raka Noviyanto',
//   email: 'raka@gmail.com',
//   phone: '62877959596',
// );
