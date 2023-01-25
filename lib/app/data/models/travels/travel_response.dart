// To parse this JSON data, do
//
//     final travelResponse = travelResponseFromJson(jsonString);

import 'dart:convert';

TravelResponse travelResponseFromJson(String str) => TravelResponse.fromJson(json.decode(str));

String travelResponseToJson(TravelResponse data) => json.encode(data.toJson());

class TravelResponse {
  TravelResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.items,
  });

  bool status;
  int code;
  String message;
  Items items;

  factory TravelResponse.fromJson(Map<String, dynamic> json) => TravelResponse(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    items: Items.fromJson(json["items"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "items": items.toJson(),
  };
}

class Items {
  Items({
    required this.id,
    required this.parentId,
    required this.status,
    required this.image,
    required this.travels,
    required this.name,
    required this.shortDetails,
    required this.details,
    this.pageName,
    this.pageDetails,
  });

  int id;
  int parentId;
  String status;
  String image;
  List<Travel> travels;
  String name;
  String shortDetails;
  String details;
  dynamic pageName;
  dynamic pageDetails;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    id: json["id"],
    parentId: json["parent_id"],
    status: json["status"],
    image: json["image"],
    travels: List<Travel>.from(json["travels"].map((x) => Travel.fromJson(x))),
    name: json["name"],
    shortDetails: json["short_details"],
    details: json["details"],
    pageName: json["page_name"],
    pageDetails: json["page_details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "status": status,
    "image": image,
    "travels": List<dynamic>.from(travels.map((x) => x.toJson())),
    "name": name,
    "short_details": shortDetails,
    "details": details,
    "page_name": pageName,
    "page_details": pageDetails,
  };
}

class Travel {
  Travel({
    required this.id,
    required this.url,
    required this.status,
    required this.image,
    required this.createdAt,
    required this.name,
    required this.shortDetails,
    required this.details,
  });

  int id;
  String url;
  String status;
  String image;
  DateTime createdAt;
  String name;
  String shortDetails;
  String details;

  factory Travel.fromJson(Map<String, dynamic> json) => Travel(
    id: json["id"],
    url: json["url"],
    status: json["status"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    name: json["name"],
    shortDetails: json["short_details"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "status": status,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "name": name,
    "short_details": shortDetails,
    "details": details,
  };
}
