// To parse this JSON data, do
//
//     final aboutUsResponse = aboutUsResponseFromJson(jsonString);

import 'dart:convert';

AboutUsResponse aboutUsResponseFromJson(String str) => AboutUsResponse.fromJson(json.decode(str));

String aboutUsResponseToJson(AboutUsResponse data) => json.encode(data.toJson());

class AboutUsResponse {
  AboutUsResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.page,
  });

  bool status;
  int code;
  String message;
  Page page;

  factory AboutUsResponse.fromJson(Map<String, dynamic> json) => AboutUsResponse(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    page: Page.fromJson(json["page"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "page": page.toJson(),
  };
}

class Page {
  Page({
    required this.id,
    this.slug,
    required this.views,
    required this.createdAt,
    required this.title,
    required this.description,
    this.keyWords,
    this.firstDescription,
    this.subTitle,
    this.subTitle2,
    this.subTitle3,
    this.secondeDescription,
  });

  int id;
  dynamic slug;
  int views;
  DateTime createdAt;
  String title;
  String description;
  dynamic keyWords;
  dynamic firstDescription;
  dynamic subTitle;
  dynamic subTitle2;
  dynamic subTitle3;
  dynamic secondeDescription;

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    id: json["id"],
    slug: json["slug"],
    views: json["views"],
    createdAt: DateTime.parse(json["created_at"]),
    title: json["title"],
    description: json["description"],
    keyWords: json["key_words"],
    firstDescription: json["first_description"],
    subTitle: json["sub_title"],
    subTitle2: json["sub_title_2"],
    subTitle3: json["sub_title_3"],
    secondeDescription: json["seconde_description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "views": views,
    "created_at": createdAt.toIso8601String(),
    "title": title,
    "description": description,
    "key_words": keyWords,
    "first_description": firstDescription,
    "sub_title": subTitle,
    "sub_title_2": subTitle2,
    "sub_title_3": subTitle3,
    "seconde_description": secondeDescription,
  };
}
