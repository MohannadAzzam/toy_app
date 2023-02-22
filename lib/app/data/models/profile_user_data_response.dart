// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'dart:convert';

ProfileResponse profileResponseFromJson(String str) => ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) => json.encode(data.toJson());

class ProfileResponse {
  ProfileResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.user,
  });

  bool status;
  int code;
  String message;
  User user;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) => ProfileResponse(
    status: json["status"],
    code: json["code"],
    message: json["message"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.id,
    required this.type,
    this.typeMobile,
    required this.receiveNotification,
    required this.name,
    required this.email,
    required this.mobile,
    required this.expertRequse,
    this.myExperience,
    this.description,
    this.price,
    this.sponsorPackgeId,
    this.spaceId,
    required this.countryId,
    this.categoryId,
    required this.image,
    this.rememberToken,
    required this.status,
    required this.avgRate,
    required this.rateCount,
    required this.balance,
    required this.verified,
    this.socialToken,
    this.socialType,
    this.avatar,
    required this.tickets,
    required this.space,
    required this.sponsorPackge,
    required this.countryName,
  });

  int id;
  int type;
  dynamic typeMobile;
  int receiveNotification;
  String name;
  String email;
  String mobile;
  int expertRequse;
  dynamic myExperience;
  dynamic description;
  dynamic price;
  dynamic sponsorPackgeId;
  dynamic spaceId;
  int countryId;
  dynamic categoryId;
  String image;
  dynamic rememberToken;
  String status;
  int avgRate;
  int rateCount;
  int balance;
  int verified;
  dynamic socialToken;
  dynamic socialType;
  dynamic avatar;
  List<dynamic> tickets;
  List<dynamic> space;
  List<dynamic> sponsorPackge;
  String countryName;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    type: json["type"],
    typeMobile: json["type_mobile"],
    receiveNotification: json["receive_notification"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    expertRequse: json["expert_requse"],
    myExperience: json["my_experience"],
    description: json["description"],
    price: json["price"],
    sponsorPackgeId: json["sponsor_packge_id"],
    spaceId: json["space_id"],
    countryId: json["country_id"],
    categoryId: json["category_id"],
    image: json["image"],
    rememberToken: json["remember_token"],
    status: json["status"],
    avgRate: json["avg_rate"],
    rateCount: json["rate_count"],
    balance: json["balance"],
    verified: json["verified"],
    socialToken: json["social_token"],
    socialType: json["social_type"],
    avatar: json["avatar"],
    tickets: List<dynamic>.from(json["tickets"].map((x) => x)),
    space: List<dynamic>.from(json["space"].map((x) => x)),
    sponsorPackge: List<dynamic>.from(json["sponsorPackge"].map((x) => x)),
    countryName: json["country_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "type_mobile": typeMobile,
    "receive_notification": receiveNotification,
    "name": name,
    "email": email,
    "mobile": mobile,
    "expert_requse": expertRequse,
    "my_experience": myExperience,
    "description": description,
    "price": price,
    "sponsor_packge_id": sponsorPackgeId,
    "space_id": spaceId,
    "country_id": countryId,
    "category_id": categoryId,
    "image": image,
    "remember_token": rememberToken,
    "status": status,
    "avg_rate": avgRate,
    "rate_count": rateCount,
    "balance": balance,
    "verified": verified,
    "social_token": socialToken,
    "social_type": socialType,
    "avatar": avatar,
    "tickets": List<dynamic>.from(tickets.map((x) => x)),
    "space": List<dynamic>.from(space.map((x) => x)),
    "sponsorPackge": List<dynamic>.from(sponsorPackge.map((x) => x)),
    "country_name": countryName,
  };
}
