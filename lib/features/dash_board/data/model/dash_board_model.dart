import 'package:flutter/material.dart';

class DashBoardModel {
  String imagePath;
  String title;
  Widget Function(BuildContext) page;

  DashBoardModel({
    required this.imagePath,
    required this.title,
    required this.page,
  });

  DashBoardModel copyWith({
    String? imagePath,
    String? title,
    Widget Function(BuildContext)? page,
  }) {
    return DashBoardModel(
      imagePath: imagePath ?? this.imagePath,
      title: title ?? this.title,
      page: page ?? this.page,
    );
  }
}
