import 'package:demo/export.dart';

import '../../../core/widgets/web_view_screen.dart';
import '../../report/widget/report_screen_appbar.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  static Widget builder(BuildContext context) {
    logV("SettingScreen");
    return const SettingScreen();
  }

  @override
  Widget build(BuildContext context) {
    final List list = [
      // {
      //   "title": "Notification Settings",
      //   // "route": AppRoutes.orderMemoScreen,
      //   "sub_title":
      //       "Push notifications, Email notifications Sound/Vibration preferences.",
      // },
      {
        "title": "Privacy & Security",
        // "route": AppRoutes.dispatchStatusScreen,
        "sub_title": "Two factor authentication, privacy settings App Lock"
      },
      {
        "title": "FAQ’s",
        "route": AppRoutes.faqScreen,
        "sub_title": "Link to common questions."
      },
      // {
      //   "title": "Change Language",
      //   "route": AppRoutes.dispatchStatusScreen,
      //   "sub_title": "Choose your language"
      // },
      // {
      //   "title": "Delete Account",
      //   "route": AppRoutes.dispatchStatusScreen,
      //   "sub_title": "deactivate account or delete"
      // },
      // {
      //   "title": "Contact Us",
      //   "route": AppRoutes.dispatchStatusScreen,
      //   "sub_title": "Link to contact us."
      // },
    ];
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: reportScreenAppbar("Settings"),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: AppColors.textGrey5.withValues(alpha: .33),
          height: getSize(5),
        ),
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Container(
            // color: AppColors.backGroundColor,
            padding: getPadding(all: 8),
            child: InkWell(
              onTap: () {
                if (index == 0) {
                  NavigatorService.push(
                      context,
                      WebViewScreen(
                          url: AppStrings.privacyPolicyUrl,
                          title: "Privacy Policy"));
                } else {
                  if (list[index]['route'] != null) {
                    Navigator.pushNamed(context, list[index]['route']);
                  }
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: list[index]['title'],
                    style: CustomTextStyle.bodyText.copyWith(
                      color: Color(0xFF656565),
                      fontSize: getSize(16),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  CustomText(
                    text: list[index]['sub_title'],
                    style: CustomTextStyle.bodyText.copyWith(
                      color: Color(0xFFA09D9D),
                      fontSize: getSize(13),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
