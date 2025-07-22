// To parse this JSON data, do
//
//     final activeBannersModel = activeBannersModelFromJson(jsonString);

import 'dart:convert';

ActiveBannersModel activeBannersModelFromJson(String str) => ActiveBannersModel.fromJson(json.decode(str));

String activeBannersModelToJson(ActiveBannersModel data) => json.encode(data.toJson());

class ActiveBannersModel {
  List<BannerModel>? data;
  bool? succeeded;
  List<dynamic>? messages;

  ActiveBannersModel({
    this.data,
    this.succeeded,
    this.messages,
  });

  factory ActiveBannersModel.fromJson(Map<String, dynamic> json) => ActiveBannersModel(
    data: json["data"] == null ? [] : List<BannerModel>.from(json["data"]!.map((x) => BannerModel.fromJson(x))),
    succeeded: json["succeeded"],
    messages: json["messages"] == null ? [] : List<dynamic>.from(json["messages"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "succeeded": succeeded,
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
  };
}

class BannerModel {
  dynamic message;
  String? bannerName;
  String? bannerUrl;
  String? shopifyUrl;
  String? remarks;
  String? category;
  int? siteId;
  int? id;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  bool? isActive;

  BannerModel({
    this.message,
    this.bannerName,
    this.bannerUrl,
    this.shopifyUrl,
    this.remarks,
    this.category,
    this.siteId,
    this.id,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.isActive,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    message: json["message"],
    bannerName: json["bannerName"],
    bannerUrl: json["bannerUrl"],
    shopifyUrl: json["shopifyUrl"],
    remarks: json["remarks"],
    category: json["category"],
    siteId: json["siteId"],
    id: json["id"],
    createdBy: json["createdBy"],
    createdOn: json["createdOn"],
    modifiedBy: json["modifiedBy"],
    modifiedOn: json["modifiedOn"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "bannerName": bannerName,
    "bannerUrl": bannerUrl,
    "shopifyUrl": shopifyUrl,
    "remarks": remarks,
    "category": category,
    "siteId": siteId,
    "id": id,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "isActive": isActive,
  };
}
