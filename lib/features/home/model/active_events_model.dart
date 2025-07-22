// To parse this JSON data, do
//
//     final activeEventsModel = activeEventsModelFromJson(jsonString);

import 'dart:convert';

ActiveEventsModel activeEventsModelFromJson(String str) => ActiveEventsModel.fromJson(json.decode(str));

String activeEventsModelToJson(ActiveEventsModel data) => json.encode(data.toJson());

class ActiveEventsModel {
  List<EventItem>? data;
  bool? succeeded;
  List<dynamic>? messages;

  ActiveEventsModel({
    this.data,
    this.succeeded,
    this.messages,
  });

  factory ActiveEventsModel.fromJson(Map<String, dynamic> json) => ActiveEventsModel(
    data: json["data"] == null ? [] : List<EventItem>.from(json["data"]!.map((x) => EventItem.fromJson(x))),
    succeeded: json["succeeded"],
    messages: json["messages"] == null ? [] : List<dynamic>.from(json["messages"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "succeeded": succeeded,
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
  };
}

class EventItem {
  String? title;
  String? description;
  String? eventDateTime;
  String? venue;
  String? imageUrl;
  dynamic remarks;
  int? siteId;
  int? id;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  bool? isActive;

  EventItem({
    this.title,
    this.description,
    this.eventDateTime,
    this.venue,
    this.imageUrl,
    this.remarks,
    this.siteId,
    this.id,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.isActive,
  });

  factory EventItem.fromJson(Map<String, dynamic> json) => EventItem(
    title: json["title"],
    description: json["description"],
    eventDateTime: json["eventDateTime"],
    venue: json["venue"],
    imageUrl: json["imageUrl"],
    remarks: json["remarks"],
    siteId: json["siteId"],
    id: json["id"],
    createdBy: json["createdBy"],
    createdOn: json["createdOn"],
    modifiedBy: json["modifiedBy"],
    modifiedOn: json["modifiedOn"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "eventDateTime": eventDateTime,
    "venue": venue,
    "imageUrl": imageUrl,
    "remarks": remarks,
    "siteId": siteId,
    "id": id,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "isActive": isActive,
  };
}
