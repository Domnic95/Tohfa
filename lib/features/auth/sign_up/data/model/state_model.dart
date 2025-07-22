// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

List<StateModel> stateModelFromJson(String str) => List<StateModel>.from(json.decode(str).map((x) => StateModel.fromJson(x)));

String stateModelToJson(List<StateModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StateModel {
  dynamic id;
  dynamic stateName;
  dynamic countryId;
  dynamic countryName;
  bool? isActive;

  StateModel({
    this.id,
    this.stateName,
    this.countryId,
    this.countryName,
    this.isActive,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
    id: json["id"],
    stateName: json["stateName"],
    countryId: json["countryId"],
    countryName: json["countryName"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "stateName": stateName,
    "countryId": countryId,
    "countryName": countryName,
    "isActive": isActive,
  };
}
