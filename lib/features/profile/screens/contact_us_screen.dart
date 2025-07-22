import 'package:demo/export.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../report/widget/report_screen_appbar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  static Widget builder(BuildContext context) {
    return const ContactUsScreen();
  }

  @override
  Widget build(BuildContext context) {
    final List list = [
      {
        "title": "Call Us",
        // "route": AppRoutes.orderMemoScreen,
        "image": ImageConstants.phone
      },
      {
        "title": "Mail",
        // "route": AppRoutes.dispatchStatusScreen,
        "image": ImageConstants.mail
      },
      // {
      //   "title": "Support",
      //   "route": AppRoutes.faqScreen,
      //   "image": ImageConstants.support
      // },
      {
        "title": "Feedback",
        "route": AppRoutes.feedBackScreen,
        "image": ImageConstants.feedbacks
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

    final socialMedia = [
      {
        "image":ImageConstants.instagram,
        "link": "https://www.instagram.com/tohfajewelry/",
      },
      {
        "image":ImageConstants.youtube,
        "link": "https://www.youtube.com/channel/UCKqYpFsb17ts5wiUhKdtM2A",
      },
      {
        "image":ImageConstants.fb,
        "link": "https://www.facebook.com/TohfaJewelry",
      },
    ];
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: reportScreenAppbar("Contact Us"),
      body: SingleChildScrollView(
        child: Column(
          spacing: getSize(30),
          children: [
            ListView.separated(
              primary: false,
              shrinkWrap: true,
              padding: getPadding(all: 8),
              separatorBuilder: (context, index) => Divider(
                color: AppColors.textGrey5.withValues(alpha: .33),
                height: getSize(5),
              ),
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Container(
                  // backgroundColor: AppColors.bgColor,
                  padding: getPadding(all: 8),
                  child: InkWell(
                    onTap: () async {
                      if (index == 0) {
                        final Uri launchUri = Uri(
                          scheme: 'tel',
                          path: "+919029319993",
                        );
                        await launchUrl(launchUri);
                      } else if (index == 1) {
                        final Uri emailUri = Uri(
                          scheme: 'mailto',
                          path: 'sales@tohfajewellery.in',
                          // queryParameters: {
                          //   'subject': 'Urgent: App Issue',
                          //   'body': 'Dear Support Team,\n\nI encountered an issue...',
                          //   'cc': 'manager@example.com',
                          //   'bcc': 'log@example.com',
                          // },
                        );
                        await launchUrl(emailUri);
                      } else {
                        if (list[index]['route'] != null) {
                          Navigator.pushNamed(context, list[index]['route']);
                        }
                      }
                      // if (index == 1) {
                      //   NavigatorService.push(
                      //       context,
                      //       WebViewScreen(
                      //           url: AppStrings.privacyPolicyUrl,
                      //           title: "Privacy Policy"));
                      // } else {
                      //   if (list[index]['route'] != null) {
                      //     Navigator.pushNamed(context, list[index]['route']);
                      //   }
                      // }
                    },
                    child: Row(
                      spacing: getSize(20),
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: getSize(18),
                          child: CustomImageView(
                            imagePath: list[index]['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: CustomText(
                            text: list[index]['title'],
                            style: CustomTextStyle.bodyText.copyWith(
                              color: Color(0xFF828A89),
                              fontSize: getSize(16),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Column(
              spacing: getSize(10),
              children: [
                CustomText(
                  text: "Social Media",
                  style: CustomTextStyle.bodyText.copyWith(
                    color: Color(0xFF848382),
                    fontSize: getSize(18),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: getSize(24),
                  child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => getSizeBox(width: 10),
                    itemCount: socialMedia.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          await launchUrl(Uri.parse(socialMedia[index]["link"]!));
                        },
                        child: CustomImageView(
                          imagePath: socialMedia[index]["image"],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
