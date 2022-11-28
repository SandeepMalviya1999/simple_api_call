// To parse this JSON data, do
//
//     final unitListModel = unitListModelFromJson(jsonString);

import 'dart:convert';

List<ApiDataModel> unitListModelFromJson(String str) => List<ApiDataModel>.from(json.decode(str).map((x) => ApiDataModel.fromJson(x)));

String unitListModelToJson(List<ApiDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiDataModel {
  ApiDataModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory ApiDataModel.fromJson(Map<String, dynamic> json) => ApiDataModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}
