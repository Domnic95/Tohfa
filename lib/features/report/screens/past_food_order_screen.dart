import 'package:intl/intl.dart';

import '../../../export.dart';
import '../bloc/report_cubit.dart';
import '../bloc/report_state.dart';
import '../model/order_memo_model.dart';
import '../model/past_food_order_res_model.dart';
import '../widget/report_screen_appbar.dart';

class PastFoodOrderScreen extends StatelessWidget {
  const PastFoodOrderScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<ReportCubit>(
      create: (context) => ReportCubit()..getPastFoodOrder(),
      child: const PastFoodOrderScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: reportScreenAppbar("Past Food Order"),
      body: BlocBuilder<ReportCubit, ReportState>(
        builder: (context, state) {
          if (state is ReportErrorState) {
            return NoDataFoundView(
              message: state.errorMessage,
            );
          } else if (state is PastFoodOrderSuccessState) {
            List<PastOrderFood> orderMemoList =
                state.pastFoodOrderResModel.data ?? [];
            return orderMemoList.isEmpty
                ? const NoDataFoundView(
                    message: "No Past Food Orders Found",
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: orderMemoList.length,
                    itemBuilder: (context, index) {
                      PastOrderFood item = orderMemoList[index];

                      String date = "N/A";
                      try {
                        final inputFormat = DateFormat("MM/dd/yyyy HH:mm:ss");
                        final outputFormat = DateFormat("dd MMMM yyyy");
                        final parsedDate =
                            inputFormat.parse(item.foodOrderDate ?? "");
                        date = outputFormat.format(parsedDate);
                      } catch (e) {
                        logV("Error===>$e");
                        date = "N/A";
                      }

                      return Container(
                        padding: getPadding(all: 8),
                        child: Column(
                          spacing: getSize(5),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              spacing: getSize(10),
                              children: [
                                Expanded(
                                  child: CustomText(
                                    text: item.foodMenuName ?? "N/A",
                                    style: CustomTextStyle.bodyText.copyWith(
                                      color: AppColors.primaryText3,
                                      fontSize: getSize(14),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: CustomText(
                                    text: "Token No - ${item.foodOrderNo}",
                                    style: CustomTextStyle.bodyText.copyWith(
                                      color: AppColors.primaryText4,
                                      fontSize: getSize(13),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            ///Date
                            Row(
                              children: [
                                Expanded(
                                  child: CustomText(
                                    text: "Date - $date",
                                    style: CustomTextStyle.bodyText.copyWith(
                                      color: AppColors.primaryText4,
                                      fontSize: getSize(13),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: CustomText(
                                    text:
                                        "Order Status - ${item.itemDelvStatus}",
                                    style: CustomTextStyle.bodyText.copyWith(
                                      color: AppColors.primaryText4,
                                      fontSize: getSize(13),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CustomText(
                                  text: "Expires in 7 days",
                                  style: CustomTextStyle.bodyText.copyWith(
                                    fontSize: getSize(13),
                                    fontStyle: FontStyle.italic,
                                    color: AppColors.primaryText4,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  );
          }
          return const CustomLoading();
        },
      ),
    );
  }
}
