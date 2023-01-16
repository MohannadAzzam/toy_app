// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

List<Categories> categoriesFromJson(String str) => List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  Categories({
    this.id,
    this.parentId,
    this.status,
    this.image,
    this.name,
    this.shortDetails,
    this.details,
    this.pageName,
    this.pageDetails,
  });

  int? id;
  int? parentId;
  String? status;
  String? image;
  String? name;
  String? shortDetails;
  String? details;
  dynamic pageName;
  dynamic pageDetails;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
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
