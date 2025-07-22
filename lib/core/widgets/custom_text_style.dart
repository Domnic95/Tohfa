
import '../../export.dart';

class CustomTextStyle {
  // Common body text style
  static  TextStyle bodyText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black,
  );

  // Heading text style
  static  TextStyle headingText = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    fontFamily: AppStrings.fontFamily2,
    color: AppColors.primaryColor,
  );

  // Subtitle text style
  static  TextStyle subtitleText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: AppStrings.fontFamily,
    color: AppColors.primaryColorDark,
  );

  // Custom error text style
  static const TextStyle errorText = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: Colors.red,
  );

  // Custom normal text style
  static  TextStyle normalText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: AppStrings.fontFamily,
    color: AppColors.blackText,
  );

  // Custom bold text style
  static const TextStyle boldText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );


}
