import 'dart:core';

class UserModel {
  String uid;
  String email;
  String createdAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json["uid"],
      email: json["email"],
      createdAt: json["createdAt"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "createdAt": createdAt,
    };
  }
}