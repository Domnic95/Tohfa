// To parse this JSON data, do
//
//     final visitStatusModel = visitStatusModelFromJson(jsonString);

import 'dart:convert';

List<VisitStatusModel> visitStatusModelFromJson(String str) => List<VisitStatusModel>.from(json.decode(str).map((x) => VisitStatusModel.fromJson(x)));

String visitStatusModelToJson(List<VisitStatusModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VisitStatusModel {
  int? siteId;
  String? siteName;
  bool? isFoodFacilityAvailable;

  VisitStatusModel({
    this.siteId,
    this.siteName,
    this.isFoodFacilityAvailable,
  });

  factory VisitStatusModel.fromJson(Map<String, dynamic> json) => VisitStatusModel(
    siteId: json["siteId"],
    siteName: json["site_name"],
    isFoodFacilityAvailable: json["isFoodFacilityAvailable"],
  );

  Map<String, dynamic> toJson() => {
    "siteId": siteId,
    "site_name": siteName,
    "isFoodFacilityAvailable": isFoodFacilityAvailable,
  };
}
