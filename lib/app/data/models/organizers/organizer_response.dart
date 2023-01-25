// To parse this JSON data, do
//
//     final organizerResponse = organizerResponseFromJson(jsonString);

import 'dart:convert';

OrganizerResponse organizerResponseFromJson(String str) => OrganizerResponse.fromJson(json.decode(str));

String organizerResponseToJson(OrganizerResponse data) => json.encode(data.toJson());

class OrganizerResponse {
  OrganizerResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.items,
  });

  bool status;
  int code;
  String message;
  Items items;

  factory OrganizerResponse.fromJson(Map<String, dynamic> json) => OrganizerResponse(
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
    required this.organizers,
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
  List<dynamic> organizers;
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
    organizers: List<dynamic>.from(json["organizers"].map((x) => x)),
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
    "organizers": List<dynamic>.from(organizers.map((x) => x)),
    "name": name,
    "short_details": shortDetails,
    "details": details,
    "page_name": pageName,
    "page_details": pageDetails,
  };
}
