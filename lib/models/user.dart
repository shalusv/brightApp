import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:bright_ui/global.dart';

class User {
  int userId;
  String userName;
  int employeeId;
  String employeeName;
  int roleId;
  String role;
  int positionID;
  String position;
  String password;

  User({
    this.userId,
    this.userName,
    this.employeeId,
    this.employeeName,
    this.roleId,
    this.role,
    this.positionID,
    this.position,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json["userId"],
      userName: json["user_name"],
      employeeId: json["employee_id"],
      employeeName: json["name"],
      roleId: json["role_id"],
      role: json["role"],
      positionID: json["position_id"],
      position: json["position"],
      password: json["password"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "userName": userName,
      "employeeId": employeeId,
      "employeeName": employeeName,
      "roleId": roleId,
      "role": role,
      "positionID": positionID,
      "position": position,
    };
  }

  Future<List<User>> fetchAll() async {
    final response = await http.get(Uri.parse("${apiServer}user"));
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((users) => User.fromJson(users)).toList();
    } else {
      throw Exception('Failed to load Positions');
    }
  }
}
