// To parse this JSON data, do
//
//     final isdCodeModel = isdCodeModelFromJson(jsonString);

import 'dart:convert';

List<IsdCodeModel> isdCodeModelFromJson(String str) => List<IsdCodeModel>.from(
    json.decode(str).map((x) => IsdCodeModel.fromJson(x)));

String isdCodeModelToJson(List<IsdCodeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IsdCodeModel {
  dynamic disabled;
  dynamic group;
  dynamic selected;
  String? text;
  String? value;

  IsdCodeModel({
    this.disabled,
    this.group,
    this.selected,
    this.text,
    this.value,
  });

  factory IsdCodeModel.fromJson(Map<String, dynamic> json) => IsdCodeModel(
        disabled: json["disabled"],
        group: json["group"],
        selected: json["selected"],
        text: json["text"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "disabled": disabled,
        "group": group,
        "selected": selected,
        "text": text,
        "value": value,
      };
}
