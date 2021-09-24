import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bright_ui/global.dart';

class Position {
  String position;
  int positionId;
  DateTime createdDate;
  DateTime updatedDate;
  // Position({this.positionId, this.position});
  Position({
    this.positionId,
    this.position,
  });
  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      positionId: json["position_id"],
      position: json["position"].toString(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "position_id": positionId,
      "position": position,
    };
  }

  Future<List<Position>> fetchPositions() async {
    final response = await http.get(Uri.parse("${apiServer}position"));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      return body.map((position) => Position.fromJson(position)).toList();
    } else {
      throw Exception('Failed to load Positions');
    }
  }

  Future<Position> fetchPosition(int positionId) async {
    final response =
        await http.get(Uri.parse("${apiServer}position${positionId}"));

    if (response.statusCode == 200) {
      return Position.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load Positions');
    }
  }
}
