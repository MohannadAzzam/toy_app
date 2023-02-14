// To parse this JSON data, do
//
//     final languageResponse = languageResponseFromJson(jsonString);

import 'dart:convert';

LanguageResponse languageResponseFromJson(String str) => LanguageResponse.fromJson(json.decode(str));

String languageResponseToJson(LanguageResponse data) => json.encode(data.toJson());

class LanguageResponse {
  LanguageResponse({
    required this.status,
    required this.code,
    required this.message,
  });

  bool status;
  int code;
  String message;

  factory LanguageResponse.fromJson(Map<String, dynamic> json) => LanguageResponse(
    status: json["status"],
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "code": code,
    "message": message,
  };
}
