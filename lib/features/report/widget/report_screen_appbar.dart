import 'package:demo/export.dart';

AppBar reportScreenAppbar(String title){
  return  AppBar(
    title: CustomText(
      text: title,
      style: CustomTextStyle.bodyText.copyWith(
        color: AppColors.primaryText3,
        fontSize: getSize(16),
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    backgroundColor: AppColors.bgColor,
    iconTheme:  IconThemeData(
      color: AppColors.primaryText3,
    ),
  );
}