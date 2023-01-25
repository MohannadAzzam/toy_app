// To parse this JSON data, do
//
//     final ticketResponse = ticketResponseFromJson(jsonString);

import 'dart:convert';

TicketResponse ticketResponseFromJson(String str) => TicketResponse.fromJson(json.decode(str));

String ticketResponseToJson(TicketResponse data) => json.encode(data.toJson());

class TicketResponse {
  TicketResponse({
    required this.status,
    required this.code,
    required this.message,
    required this.items,
  });

  bool status;
  int code;
  String message;
  Items items;

  factory TicketResponse.fromJson(Map<String, dynamic> json) => TicketResponse(
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
    required this.events,
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
  List<ItemsEvent> events;
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
    events: List<ItemsEvent>.from(json["events"].map((x) => ItemsEvent.fromJson(x))),
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
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
    "name": name,
    "short_details": shortDetails,
    "details": details,
    "page_name": pageName,
    "page_details": pageDetails,
  };
}

class ItemsEvent {
  ItemsEvent({
    required this.id,
    required this.parentId,
    required this.status,
    this.image,
    required this.name,
    required this.events,
  });

  int id;
  int parentId;
  String status;
  dynamic image;
  String name;
  List<EventEvent> events;

  factory ItemsEvent.fromJson(Map<String, dynamic> json) => ItemsEvent(
    id: json["id"],
    parentId: json["parent_id"],
    status: json["status"],
    image: json["image"],
    name: json["name"],
    events: List<EventEvent>.from(json["events"].map((x) => EventEvent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "status": status,
    "image": image,
    "name": name,
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
  };
}

class EventEvent {
  EventEvent({
    required this.id,
    required this.dayId,
    required this.time,
    required this.status,
    required this.image,
    required this.name,
    required this.details,
  });

  int id;
  int dayId;
  String time;
  String status;
  String image;
  String name;
  String details;

  factory EventEvent.fromJson(Map<String, dynamic> json) => EventEvent(
    id: json["id"],
    dayId: json["day_id"],
    time: json["time"],
    status: json["status"],
    image: json["image"],
    name: json["name"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "day_id": dayId,
    "time": time,
    "status": status,
    "image": image,
    "name": name,
    "details": details,
  };
}
