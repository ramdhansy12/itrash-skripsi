part of 'model.dart';

class User {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? password;
  String? roles;
  String? token;
  String? address;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.password,
    this.roles,
    this.address,
    this.token,
  });

  User.fromJson(Map<String, dynamic> json) {
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

  // Map<String, dynamic> toJson() {
  //   return {
  //     'id': id,
  //     'name': name,
  //     'email': email,
  //     'password': password,
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
