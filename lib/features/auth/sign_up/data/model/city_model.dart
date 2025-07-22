// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

List<CityModel> cityModelFromJson(String str) => List<CityModel>.from(json.decode(str).map((x) => CityModel.fromJson(x)));

String cityModelToJson(List<CityModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityModel {
  dynamic id;
  dynamic cityName;
  dynamic stateId;
  dynamic countryId;
  dynamic stateName;
  dynamic countryName;
  bool? isActive;

  CityModel({
    this.id,
    this.cityName,
    this.stateId,
    this.countryId,
    this.stateName,
    this.countryName,
    this.isActive,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    id: json["id"],
    cityName: json["cityName"],
    stateId: json["stateId"],
    countryId: json["countryId"],
    stateName: json["stateName"],
    countryName: json["countryName"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cityName": cityName,
    "stateId": stateId,
    "countryId": countryId,
    "stateName": stateName,
    "countryName": countryName,
    "isActive": isActive,
  };
}
