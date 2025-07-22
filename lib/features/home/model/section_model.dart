// To parse this JSON data, do
//
//     final sectionModel = sectionModelFromJson(jsonString);

import 'dart:convert';

List<SectionModel> sectionModelFromJson(String str) => List<SectionModel>.from(json.decode(str).map((x) => SectionModel.fromJson(x)));

String sectionModelToJson(List<SectionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SectionModel {
  bool? disabled;
  dynamic group;
  bool? selected;
  String? text;
  String? value;

  SectionModel({
    this.disabled,
    this.group,
    this.selected,
    this.text,
    this.value,
  });

  SectionModel copyWith({
    bool? disabled,
    dynamic group,
    bool? selected,
    String? text,
    String? value,
  }) =>
      SectionModel(
        disabled: disabled ?? this.disabled,
        group: group ?? this.group,
        selected: selected ?? this.selected,
        text: text ?? this.text,
        value: value ?? this.value,
      );

  factory SectionModel.fromJson(Map<String, dynamic> json) => SectionModel(
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
