import '../../../export.dart';
import '../bloc/report_cubit.dart';
import '../bloc/report_state.dart';
import '../model/dispatch_status_model.dart';
import '../widget/report_screen_appbar.dart';

class DispatchStatusScreen extends StatelessWidget {
  const DispatchStatusScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<ReportCubit>(
      create: (context) => ReportCubit()..getDispatchStatus(),
      child: const DispatchStatusScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: reportScreenAppbar("Dispatch Status"),
      body: BlocBuilder<ReportCubit, ReportState>(
        builder: (context, state) {
          if (state is ReportErrorState) {
            return NoDataFoundView(
              message: state.errorMessage,
            );
          } else if (state is DispatchStatusSuccessState) {
            List<DispatchStatus> orderMemoList = state.dispatchStatusResModel.data ?? [];
            return orderMemoList.isEmpty
                ? const NoDataFoundView(
                    message: "No Dispatch Status Found",
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: orderMemoList.length,
                    itemBuilder: (context, index) {
                      DispatchStatus item = orderMemoList[index];

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
                                    text: item.remarks ?? "N/A",
                                    style: CustomTextStyle.bodyText.copyWith(
                                      color: AppColors.primaryText3,
                                      fontSize: getSize(14),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: CustomText(
                                    text: "Order ID - ${item.orNo ?? "N/A"}",
                                    style: CustomTextStyle.bodyText.copyWith(
                                      fontSize: getSize(14),
                                      color: AppColors.primaryText4,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              spacing: getSize(10),
                              children: [
                                Expanded(
                                  child: CustomText(
                                    text: "Amt - ${item.totalGrossAmt ?? "N/A"}",
                                    style: CustomTextStyle.bodyText.copyWith(
                                      fontSize: getSize(14),
                                      color: AppColors.primaryText4,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: CustomText(
                                    text: "Status - ${item.dispatchStatus ?? "N/A"}",
                                    style: CustomTextStyle.bodyText.copyWith(
                                      fontSize: getSize(14),
                                      color: AppColors.primaryText4,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
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
