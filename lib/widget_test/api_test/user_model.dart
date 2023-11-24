// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String email;
  final String name;
  final int id;
  User({
    required this.email,
    required this.name,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result.addAll({'email': email});
    result.addAll({'name': name});
    result.addAll({'id': id});

    return result;
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      email: map['email'],
      name: map['name'],
      id: map['id'],
    );
  }
}
