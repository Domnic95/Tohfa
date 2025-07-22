// To parse this JSON data, do
//
//     final pastFoodOrderResModel = pastFoodOrderResModelFromJson(jsonString);

import 'dart:convert';

PastFoodOrderResModel pastFoodOrderResModelFromJson(String str) => PastFoodOrderResModel.fromJson(json.decode(str));

String pastFoodOrderResModelToJson(PastFoodOrderResModel data) => json.encode(data.toJson());

class PastFoodOrderResModel {
  List<PastOrderFood>? data;

  PastFoodOrderResModel({
    this.data,
  });

  PastFoodOrderResModel copyWith({
    List<PastOrderFood>? data,
  }) =>
      PastFoodOrderResModel(
        data: data ?? this.data,
      );

  factory PastFoodOrderResModel.fromJson(Map<String, dynamic> json) => PastFoodOrderResModel(
    data: json["data"] == null ? [] : List<PastOrderFood>.from(json["data"]!.map((x) => PastOrderFood.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class PastOrderFood {
  dynamic id;
  dynamic headerId;
  String? categoryName;
  String? foodMenuName;
  dynamic itemQty;
  dynamic itemRate;
  dynamic itemValue;
  String? itemDelvStatus;
  String? itemInstructions;
  bool? isMirrorSync;
  String? createdBy;
  DateTime? createdDate;
  dynamic modifiedBy;
  dynamic modifiedDate;
  bool? isActive;
  String? foodOrderNo;
  String? foodOrderDate;

  PastOrderFood({
    this.id,
    this.headerId,
    this.categoryName,
    this.foodMenuName,
    this.itemQty,
    this.itemRate,
    this.itemValue,
    this.itemDelvStatus,
    this.itemInstructions,
    this.isMirrorSync,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.isActive,
    this.foodOrderNo,
    this.foodOrderDate,
  });

  PastOrderFood copyWith({
    dynamic id,
    dynamic headerId,
    String? categoryName,
    String? foodMenuName,
    dynamic itemQty,
    dynamic itemRate,
    dynamic itemValue,
    String? itemDelvStatus,
    String? itemInstructions,
    bool? isMirrorSync,
    String? createdBy,
    DateTime? createdDate,
    dynamic modifiedBy,
    dynamic modifiedDate,
    bool? isActive,
    String? foodOrderNo,
    String? foodOrderDate,
  }) =>
      PastOrderFood(
        id: id ?? this.id,
        headerId: headerId ?? this.headerId,
        categoryName: categoryName ?? this.categoryName,
        foodMenuName: foodMenuName ?? this.foodMenuName,
        itemQty: itemQty ?? this.itemQty,
        itemRate: itemRate ?? this.itemRate,
        itemValue: itemValue ?? this.itemValue,
        itemDelvStatus: itemDelvStatus ?? this.itemDelvStatus,
        itemInstructions: itemInstructions ?? this.itemInstructions,
        isMirrorSync: isMirrorSync ?? this.isMirrorSync,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        modifiedBy: modifiedBy ?? this.modifiedBy,
        modifiedDate: modifiedDate ?? this.modifiedDate,
        isActive: isActive ?? this.isActive,
        foodOrderNo: foodOrderNo ?? this.foodOrderNo,
        foodOrderDate: foodOrderDate ?? this.foodOrderDate,
      );

  factory PastOrderFood.fromJson(Map<String, dynamic> json) => PastOrderFood(
    id: json["id"],
    headerId: json["headerId"],
    categoryName: json["categoryName"],
    foodMenuName: json["foodMenuName"],
    itemQty: json["itemQty"],
    itemRate: json["itemRate"],
    itemValue: json["itemValue"],
    itemDelvStatus: json["itemDelvStatus"],
    itemInstructions: json["itemInstructions"],
    isMirrorSync: json["isMirrorSync"],
    createdBy: json["createdBy"],
    createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
    modifiedBy: json["modifiedBy"],
    modifiedDate: json["modifiedDate"],
    isActive: json["isActive"],
    foodOrderNo: json["foodOrderNo"],
    foodOrderDate: json["foodOrderDate"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "headerId": headerId,
    "categoryName": categoryName,
    "foodMenuName": foodMenuName,
    "itemQty": itemQty,
    "itemRate": itemRate,
    "itemValue": itemValue,
    "itemDelvStatus": itemDelvStatus,
    "itemInstructions": itemInstructions,
    "isMirrorSync": isMirrorSync,
    "createdBy": createdBy,
    "createdDate": createdDate?.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedDate": modifiedDate,
    "isActive": isActive,
    "foodOrderNo": foodOrderNo,
    "foodOrderDate": foodOrderDate,
  };
}
