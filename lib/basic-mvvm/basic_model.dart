import 'package:flutter/material.dart';

@immutable
class BasicModel {
  const BasicModel(this.userName);

  final String userName;

  @override
  bool operator ==(covariant BasicModel other) {
    if (identical(this, other)) return true;

    return other.userName == userName;
  }

  @override
  int get hashCode => userName.hashCode;

  BasicModel copyWith({
    String? userName,
  }) {
    return BasicModel(
      userName ?? this.userName,
    );
  }
}
