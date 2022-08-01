// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.gender,
    this.username,
    this.password,
  });

  int? id;
  String? firstName;
  String? lastName;
  int? gender;
  String? username;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    gender: json["gender"],
    username: json["username"] == null ? null : json["username"],
    password: json["password"] == null ? null : json["password"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "gender": gender,
    "username": username == null ? null : username,
    "password": password == null ? null : password,
  };
}
