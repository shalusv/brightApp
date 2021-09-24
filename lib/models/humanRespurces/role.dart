import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bright_ui/global.dart';

class Role {
  String role;
  int roleId;
  String createdDate;

  // Position({this.positionId, this.position});
  Role({
    this.roleId,
    this.role,
    this.createdDate,
  });
  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      roleId: json["role_id"],
      role: json["role"].toString(),
      createdDate: json["created_date"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "position_id": roleId,
      "position": role,
    };
  }

  Future<List<Role>> fetchRoles() async {
    final response = await http.get(Uri.parse("${apiServer}role"));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((role) => Role.fromJson(role)).toList();
    } else {
      throw Exception('Failed to load roles');
    }
  }

  Future<Role> fetchPosition(int positionId) async {
    final response = await http.get(Uri.parse("${apiServer}role${roleId}"));

    if (response.statusCode == 200) {
      return Role.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Positions');
    }
  }
}
