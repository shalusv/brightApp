import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:bright_ui/global.dart';

class Employee {
  int employeeId;
  String name;
  String email;
  int mobile;
  String password;
  int gender;
  String aadhar;
  String dob;
  int positionID;
  int wage;
  String position;

  String addedDate;
  String updatedDate;
  Employee({
    this.employeeId,
    this.name,
    this.email,
    this.mobile,
    this.password,
    this.gender,
    this.aadhar,
    this.dob,
    this.positionID,
    this.wage,
    this.addedDate,
    this.updatedDate,
    this.position,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      employeeId: json["employee_id"],
      name: json["name"],
      email: json["email"],
      mobile: json["mobile"],
      password: json["password"].toString(),
      gender: json["gender"],
      aadhar: json["aadhar"].toString(),
      dob: json["dob"].toString(),
      positionID: json["position_id"],
      wage: json["wage"],
      addedDate: json["addedDate"].toString(),
      updatedDate: json["updatedDate"].toString(),
      position: json["position"].toString(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "employeeId": employeeId,
      "name": name,
      "email": email,
      "mobile": mobile,
      "password": password,
      "gender": gender,
      "aadhar": aadhar,
      "dob": dob,
      "positionID": positionID,
      "wage": wage,
      "createdDate": addedDate,
      "updatedDate": updatedDate,
      "position": position,
    };
  }

  Future<List<Employee>> fetchAll() async {
    final response = await http.get(Uri.parse("${apiServer}employee"));
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((position) => Employee.fromJson(position)).toList();
    } else {
      throw Exception('Failed to load Positions');
    }
  }
}
