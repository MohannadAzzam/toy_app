// To parse this JSON data, do
//
//     final sponsorsResponse = sponsorsResponseFromJson(jsonString);

import 'dart:convert';

SponsorsResponse sponsorsResponseFromJson(String str) => SponsorsResponse.fromJson(json.decode(str));

String sponsorsResponseToJson(SponsorsResponse data) => json.encode(data.toJson());

class SponsorsResponse {
  SponsorsResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.items,
  });

  bool status;
  int code;
  String message;
  Items items;

  factory SponsorsResponse.fromJson(Map<String, dynamic> json) => SponsorsResponse(
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
    required this.sponsors,
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
  List<dynamic> sponsors;
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
    sponsors: List<dynamic>.from(json["sponsors"].map((x) => x)),
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
    "sponsors": List<dynamic>.from(sponsors.map((x) => x)),
    "name": name,
    "short_details": shortDetails,
    "details": details,
    "page_name": pageName,
    "page_details": pageDetails,
  };
}
