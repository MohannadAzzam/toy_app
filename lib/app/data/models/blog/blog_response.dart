// To parse this JSON data, do
//
//     final blogResponse = blogResponseFromJson(jsonString);

import 'dart:convert';

BlogResponse blogResponseFromJson(String str) => BlogResponse.fromJson(json.decode(str));

String blogResponseToJson(BlogResponse data) => json.encode(data.toJson());

class BlogResponse {
  BlogResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.items,
  });

  bool status;
  int code;
  String message;
  List<Item> items;

  factory BlogResponse.fromJson(Map<String, dynamic> json) => BlogResponse(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    required this.id,
    required this.userId,
    required this.categoryId,
    required this.viewCount,
    required this.image,
    required this.status,
    required this.createdAt,
    required this.name,
    required this.shortDetails,
    required this.details,
    this.author,
  });

  int id;
  String userId;
  int categoryId;
  String viewCount;
  String image;
  String status;
  DateTime createdAt;
  String name;
  String shortDetails;
  String details;
  dynamic author;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    userId: json["user_id"],
    categoryId: json["category_id"],
    viewCount: json["view_count"],
    image: json["image"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    name: json["name"],
    shortDetails: json["short_details"],
    details: json["details"],
    author: json["author"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category_id": categoryId,
    "view_count": viewCount,
    "image": image,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "name": name,
    "short_details": shortDetails,
    "details": details,
    "author": author,
  };
}
