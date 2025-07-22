import 'package:demo/export.dart';

import '../../report/widget/report_screen_appbar.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  static Widget builder(BuildContext context) {
    logV("SettingScreen");
    return const FaqScreen();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faqList = [
      {
        "Question": "Why TohfaJewellery.in?",
        "Answer":
            "Tohfajewellery.com is one of the Cheapest & Best Top 10 Online Artificial Jewellery Wholesale / B2B Suppliers in India with the collection of more than 1 Lakh+ products.",
      },
      {
        "Question": "How do I create an account?",
        "Answer":
            "Creating an account is simple! Just visit our Login / Sign Up page and fill out your details to get started.",
      },
      {
        "Question": "Can I browse products without an account?",
        "Answer":
            "Yes, you can browse our extensive collection of products without an account, but you will need to create one to place orders.",
      },
      {
        "Question": "What are the benefits of shopping on TohfaJewellery.in?",
        "Answer":
            "Enjoy competitive pricing, daily updates on new products, access to thousands of designs with ease of shopping from your shop / business and fastest shipping options.",
      },
      {
        "Question":
            "What types of products are available on TohfaJewellery.in?",
        "Answer":
            "We offer a diverse selection of designs in wholesale jewellery including jewellery accessories, hair accessories, fashion accessories for men, women and children.",
      },
      {
        "Question": "How often are new products added to the site?",
        "Answer":
            "New products are added daily, ensuring you have access to the latest trends and styles for your shop to offer to your customers.",
      },
      {
        "Question": "Is there any Minimum Order value to be purchased?",
        "Answer":
            "Yes, as we only deal in B2B / Wholesale segment, our Minimum order value is 25,000/-.",
      },
      {
        "Question": "How can I contact customer support?",
        "Answer":
            "You can reach our customer support team through the Contact Us page or email us directly at customercare@tohfajewellery.in for assistance. For quick support you can also chat with us on our WhatsApp +91 9930 799 799.",
      },
    ];
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: reportScreenAppbar("FAQs"),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: AppColors.textGrey5.withValues(alpha: .33),
          height: getSize(5),
        ),
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          return Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent, // Remove default ExpansionTile divider
            ),
            child: ExpansionTile(
              // tilePadding: getPadding(all: 8),
              childrenPadding: getPadding(left: 8, right: 8, bottom: 12),
              tilePadding: getPadding(left: 5, right: 5),
              title:  CustomText(
                text: faqList[index]["Question"]!,
                style: CustomTextStyle.bodyText.copyWith(
                  color:Color(0xFF656565),
                  fontSize: getSize(14),
                  fontWeight: FontWeight.w500,
                ),
              ),
              children: [
                CustomText(
                  text: faqList[index]["Answer"]!,
                  style: CustomTextStyle.bodyText.copyWith(
                    color: AppColors.textGrey5,
                    fontSize: getSize(14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
