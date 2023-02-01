// To parse this JSON data, do
//
//     final commonQuestionResponse = commonQuestionResponseFromJson(jsonString);

import 'dart:convert';

CommonQuestionResponse commonQuestionResponseFromJson(String str) => CommonQuestionResponse.fromJson(json.decode(str));

String commonQuestionResponseToJson(CommonQuestionResponse data) => json.encode(data.toJson());

class CommonQuestionResponse {
  CommonQuestionResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.items,
  });

  bool status;
  int code;
  String message;
  List<Item> items;

  factory CommonQuestionResponse.fromJson(Map<String, dynamic> json) => CommonQuestionResponse(
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
    required this.status,
    required this.createdAt,
    required this.question,
    required this.answer,
  });

  int id;
  String status;
  DateTime createdAt;
  String question;
  String answer;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    question: json["question"],
    answer: json["answer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "question": question,
    "answer": answer,
  };
}
