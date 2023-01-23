// To parse this JSON data, do
//
//     final homeResponse = homeResponseFromJson(jsonString);

import 'dart:convert';

HomeResponse? homeResponseFromJson(String str) => HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse? data) => json.encode(data!.toJson());

class HomeResponse {
  HomeResponse({
    this.status,
    this.code,
    this.message,
    this.items,
  });

  bool? status;
  int? code;
  String? message;
  Items? items;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    items: Items.fromJson(json["items"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "items": items!.toJson(),
  };
}

class Items {
  Items({
    this.categores,
    this.supportTeams,
    this.blogs,
    this.news,
  });

  List<Categore?>? categores;
  List<SupportTeam?>? supportTeams;
  List<Blog?>? blogs;
  List<News?>? news;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
    categores: json["categores"] == null ? [] : List<Categore?>.from(json["categores"]!.map((x) => Categore.fromJson(x))),
    supportTeams: json["supportTeams"] == null ? [] : List<SupportTeam?>.from(json["supportTeams"]!.map((x) => SupportTeam.fromJson(x))),
    blogs: json["blogs"] == null ? [] : List<Blog?>.from(json["blogs"]!.map((x) => Blog.fromJson(x))),
    news: json["news"] == null ? [] : List<News?>.from(json["news"]!.map((x) => News.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "categores": categores == null ? [] : List<dynamic>.from(categores!.map((x) => x!.toJson())),
    "supportTeams": supportTeams == null ? [] : List<dynamic>.from(supportTeams!.map((x) => x!.toJson())),
    "blogs": blogs == null ? [] : List<dynamic>.from(blogs!.map((x) => x!.toJson())),
    "news": news == null ? [] : List<dynamic>.from(news!.map((x) => x!.toJson())),
  };
}

class Blog {
  Blog({
    this.id,
    this.userId,
    this.categoryId,
    this.viewCount,
    this.image,
    this.status,
    this.createdAt,
    this.name,
    this.shortDetails,
    this.details,
    this.author,
  });

  int? id;
  String? userId;
  int? categoryId;
  String? viewCount;
  String? image;
  String? status;
  DateTime? createdAt;
  String? name;
  String? shortDetails;
  String? details;
  dynamic author;

  factory Blog.fromJson(Map<String, dynamic> json) => Blog(
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
    "created_at": createdAt?.toIso8601String(),
    "name": name,
    "short_details": shortDetails,
    "details": details,
    "author": author,
  };
}

class Categore {

  Categore({
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

  factory Categore.fromJson(Map<String, dynamic> json) => Categore(
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

class News {
  News({
    this.id,
    this.userId,
    this.categoryId,
    this.viewCount,
    this.image,
    this.status,
    this.createdAt,
    this.name,
    this.shortDetails,
    this.details,
    this.author,
  });

  int? id;
  int? userId;
  int? categoryId;
  int? viewCount;
  String? image;
  String? status;
  DateTime? createdAt;
  String? name;
  String? shortDetails;
  String? details;
  String? author;

  factory News.fromJson(Map<String, dynamic> json) => News(
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
    "created_at": createdAt?.toIso8601String(),
    "name": name,
    "short_details": shortDetails,
    "details": details,
    "author": author,
  };
}

class SupportTeam {
  SupportTeam({
    this.id,
    this.email,
    this.mobile,
    this.image,
    this.status,
    this.name,
    this.position,
  });

  int? id;
  String? email;
  dynamic mobile;
  String? image;
  String? status;
  String? name;
  String? position;

  factory SupportTeam.fromJson(Map<String, dynamic> json) => SupportTeam(
    id: json["id"],
    email: json["email"],
    mobile: json["mobile"],
    image: json["image"],
    status: json["status"],
    name: json["name"],
    position: json["position"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "mobile": mobile,
    "image": image,
    "status": status,
    "name": name,
    "position": position,
  };
}
