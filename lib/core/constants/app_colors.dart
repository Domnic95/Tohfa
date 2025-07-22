import 'package:flutter/material.dart';

class AppColors {
  static Color primaryColor = fromHex('#6F6D6D');
  static Color primaryColorDark = fromHex('#666060');
  static Color secondaryColor = fromHex('#E6C592');
  static Color primaryText = fromHex('#6D6969');
  static Color bgColor = fromHex('#FFF9F0');
  static var white = Colors.white;
  static var whiteText = Color(0xFFFCFCFC);
  static var backGroundColor = fromHex('#FAFAFB');
  static var primaryText3 = fromHex('#737373');
  static var primaryText4 = fromHex('#6E6C6C');
  static var blackText = fromHex('#1F1F1F');
  static var primaryText2 = fromHex('#454343');
  static var textGrey = fromHex('#DFDCDC');
  static var textGrey2 = fromHex('#817D78');
  static var textGrey3 = fromHex('#8B8688');
  static var textGrey4 = fromHex('#7D7E7F');
  static var textGrey5 = fromHex('#828A89');
  static var textBlue = fromHex('#227FD4');
  static var skyBlue = fromHex('#00C0C3');
  static var lightGrey = fromHex('#F2F2F2');
  static Color lightBottomNavigationColor = fromHex('#FFFFFF');
  static Color red = fromHex("#FF0000");
  static Color yellow = fromHex("#F99500");
  static var boarder = fromHex("#F8F8F8");
  static var boarder2 = fromHex("#B7B7B7");
  static var boarder3 = fromHex("#A08861");
  static Color navigationBarColor = fromHex('#101418');
  static var black = fromHex('#070A0D');
  static var lightBlack = Colors.black54;
  static var green = fromHex("#33C264");
  static var grey = Colors.grey.shade800;
  static var appIconColor = fromHex("#7A7A7A");
  static var orderStatusColor = fromHex("#AEE9D1");
  static var transparent = Colors.transparent;
  static var originalGrey = Colors.grey.shade400;

  static Color fromHex(String? hexString) {
    try {
      final buffer = StringBuffer();
      if (hexString!.length == 6 || hexString.length == 7) buffer.write('ff');
      buffer.write(hexString.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    } catch (e) {
      return Colors.black38;
    }
  }
}
