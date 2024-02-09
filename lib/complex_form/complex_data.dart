// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

@immutable
class ComplexData {
  const ComplexData({
    this.name,
    this.email,
    this.password,
    this.phone,
  });

  final String? name;
  final String? email;
  final String? password;
  final String? phone;

  ComplexData copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
  }) {
    return ComplexData(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }

  @override
  bool operator ==(covariant ComplexData other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return name.hashCode ^ email.hashCode ^ password.hashCode ^ phone.hashCode;
  }
}
