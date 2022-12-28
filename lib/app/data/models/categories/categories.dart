// To parse this JSON data, do
//
//     final categores = categoresFromJson(jsonString);

import 'dart:convert';

List<Categores> categoresFromJson(String str) => List<Categores>.from(json.decode(str).map((x) => Categores.fromJson(x)));

String categoresToJson(List<Categores> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categores {
  Categores({
    required this.id,
    required this.parentId,
    required this.status,
    required this.image,
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
  String name;
  String shortDetails;
  String details;
  dynamic pageName;
  dynamic pageDetails;

  factory Categores.fromJson(Map<String, dynamic> json) => Categores(
    id: json["id"],
    parentId: json["parent_id"],
    status: json["status"],
    image: json["image"],
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
    "name": name,
    "short_details": shortDetails,
    "details": details,
    "page_name": pageName,
    "page_details": pageDetails,
  };
}
