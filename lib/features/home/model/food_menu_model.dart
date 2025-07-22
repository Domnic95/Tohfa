// To parse this JSON data, do
//
//     final activeFoodsModel = activeFoodsModelFromJson(jsonString);

import 'dart:convert';

ActiveFoodsModel activeFoodsModelFromJson(String str) => ActiveFoodsModel.fromJson(json.decode(str));

String activeFoodsModelToJson(ActiveFoodsModel data) => json.encode(data.toJson());

class ActiveFoodsModel {
  List<FoodItem>? data;
  bool? succeeded;
  List<dynamic>? messages;

  ActiveFoodsModel({
    this.data,
    this.succeeded,
    this.messages,
  });

  factory ActiveFoodsModel.fromJson(Map<String, dynamic> json) => ActiveFoodsModel(
    data: json["data"] == null ? [] : List<FoodItem>.from(json["data"]!.map((x) => FoodItem.fromJson(x))),
    succeeded: json["succeeded"],
    messages: json["messages"] == null ? [] : List<dynamic>.from(json["messages"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "succeeded": succeeded,
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x)),
  };
}

class FoodItem {
  String? name;
  String? menuCategoryId;
  String? price;
  String? menucategoryname;
  bool? isAvailableToday;
  dynamic message;
  String? imageUrl;
  int? id;
  String? createdBy;
  String? createdOn;
  String? modifiedBy;
  String? modifiedOn;
  bool? isActive;

  FoodItem({
    this.name,
    this.menuCategoryId,
    this.price,
    this.menucategoryname,
    this.isAvailableToday,
    this.message,
    this.imageUrl,
    this.id,
    this.createdBy,
    this.createdOn,
    this.modifiedBy,
    this.modifiedOn,
    this.isActive,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
    name: json["name"],
    menuCategoryId: json["menuCategoryId"],
    price: json["price"],
    menucategoryname: json["menucategoryname"],
    isAvailableToday: json["isAvailableToday"],
    message: json["message"],
    imageUrl: json["imageUrl"],
    id: json["id"],
    createdBy: json["createdBy"],
    createdOn: json["createdOn"],
    modifiedBy: json["modifiedBy"],
    modifiedOn: json["modifiedOn"],
    isActive: json["isActive"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "menuCategoryId": menuCategoryId,
    "price": price,
    "menucategoryname": menucategoryname,
    "isAvailableToday": isAvailableToday,
    "message": message,
    "imageUrl": imageUrl,
    "id": id,
    "createdBy": createdBy,
    "createdOn": createdOn,
    "modifiedBy": modifiedBy,
    "modifiedOn": modifiedOn,
    "isActive": isActive,
  };
}
