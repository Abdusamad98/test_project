import 'package:flutter/material.dart';
import 'package:test_project/models/question_model.dart';

class RemoteSubjectModel {
  RemoteSubjectModel({
    required this.color,
    required this.id,
    required this.name,
    required this.iconPath,
  });

  final int id;
  final String name;
  final String iconPath;
  final Color color;

  factory RemoteSubjectModel.fromJson(Map<String, dynamic> json) {
    return RemoteSubjectModel(
      color: (json["color"] as String? ?? "").toColor(),
      id: json["id"] as int? ?? 0,
      name: json["name"] as String? ?? "",
      iconPath: json["iconPath"] as String? ?? "",
    );
  }





}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

// "id": 1,
// "name": "Math",
// "iconPath": "example.com",
// "color": "333"
// },
