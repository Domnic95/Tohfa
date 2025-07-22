import 'package:demo/export.dart';

Widget dontHaveAccount(){
  return Row(
    spacing: getSize(5),
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CustomText(
        text: "Don’t have an account? ",
        style: CustomTextStyle.subtitleText
            .copyWith(fontWeight: FontWeight.w500,  fontSize: getSize(14),),
      ),
      InkWell(
        onTap: () {
          NavigatorService.popAndPushNamed(AppRoutes.validatePhoneScreen);
        },
        child: CustomText(
          text: "Sign up",
          style: CustomTextStyle.subtitleText.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: getSize(16),
              decoration: TextDecoration.underline,
              decorationColor:
              AppColors.primaryColorDark),
        ),
      ),
    ],
  );
}