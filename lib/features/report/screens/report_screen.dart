import 'package:demo/export.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  static Widget builder(BuildContext context) {
    return const ReportScreen();
  }

  @override
  Widget build(BuildContext context) {
    final List reportList = [
      {
        "title": "Order Memo",
        "route": AppRoutes.orderMemoScreen,
      },
      {
        "title": "Token",
        "route": AppRoutes.tokenScreen,
      },
      {
        "title": "Dispatch Status",
        "route": AppRoutes.dispatchStatusScreen,
      },
      {
        "title": "Invoice",
        "route": AppRoutes.invoiceScreen,
      },
      {
        "title": "Past Food Orders",
        "route": AppRoutes.pastFoodOrderScreen,
      },
    ];
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Report'),
      //   centerTitle: true,
      //   backgroundColor: AppColors.primaryColor,
      // ),
      backgroundColor: AppColors.transparent,
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: AppColors.textGrey5.withValues(alpha: .33),
          height: getSize(5),
        ),
        itemCount: reportList.length,
        itemBuilder: (context, index) {
          return Container(
            padding: getPadding(all: 8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, reportList[index]['route']);
              },
              child: Row(
                children: [
                  CustomText(
                    text: reportList[index]['title'],
                    style: CustomTextStyle.bodyText.copyWith(
                      color: AppColors.textGrey5,
                      fontSize: getSize(16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.textGrey5,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
