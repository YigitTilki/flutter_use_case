import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.password,
    this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String?,
      name: json['name'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      phone: json['phone'] as String?,
    );
  }
  static List<User> get users =>
      List.generate(10, (index) => User(name: 'users_$index'));

  final String? id;
  final String? name;
  final String? userName;
  final String? email;
  final String? password;
  final String? phone;

  @override
  List<Object?> get props => [id, name, userName, email, password, phone];

  User copyWith({
    String? id,
    String? name,
    String? userName,
    String? email,
    String? password,
    String? phone,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'userName': userName,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}
