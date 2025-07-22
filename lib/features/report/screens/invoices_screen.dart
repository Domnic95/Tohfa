import 'package:intl/intl.dart';

import '../../../export.dart';
import '../bloc/report_cubit.dart';
import '../bloc/report_state.dart';
import '../model/invoices_res_model.dart';
import '../widget/report_screen_appbar.dart';

class InvoicesScreen extends StatelessWidget {
  const InvoicesScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<ReportCubit>(
      create: (context) => ReportCubit()..getInvoices(),
      child: const InvoicesScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: reportScreenAppbar("My Invoices"),
      body: BlocBuilder<ReportCubit, ReportState>(
        builder: (context, state) {
          if (state is ReportErrorState) {
            return NoDataFoundView(
              message: state.errorMessage,
            );
          } else if (state is InvoicesSuccessState) {
            List<InvoiceModel> invoicesResModel =
                state.invoicesResModel.data ?? [];
            final bloc= context.read<ReportCubit>();
            return invoicesResModel.isEmpty
                ? const NoDataFoundView(
                    message: "No Invoices Found",
                  )
                : Stack(
                  children: [
                    ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: invoicesResModel.length,
                        itemBuilder: (context, index) {
                          InvoiceModel item = invoicesResModel[index];
                          String date = "N/A";
                          try {
                            final inputFormat = DateFormat("MM/dd/yyyy HH:mm:ss");
                            final outputFormat = DateFormat("dd/MM/yy");
                            final parsedDate = inputFormat.parse(item.date ?? "");
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
                                        text: "Invoice No - ${item.salesInvoiceNo}",
                                        style: CustomTextStyle.bodyText.copyWith(
                                          color: AppColors.primaryText3,
                                          fontSize: getSize(14),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        context.read<ReportCubit>().downloadInvoice(item.id.toString());
                                      },
                                      child: Container(
                                        padding: getPadding(all: 4),
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          border: Border.all(
                                            color: AppColors.green,
                                          ),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: CustomText(
                                          text: "Download PDF",
                                          style: CustomTextStyle.bodyText.copyWith(
                                            fontSize: getSize(10),
                                            color: AppColors.primaryText4,
                                            fontWeight: FontWeight.w500,
                                          ),
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
                                        text: "Order ID - ${item.remarks}",
                                        style: CustomTextStyle.bodyText.copyWith(
                                          fontSize: getSize(14),
                                          color: AppColors.primaryText4,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: CustomText(
                                        text: "Date- $date",
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
                                        text: "Total Amt - ${item.totalValue}",
                                        style: CustomTextStyle.bodyText.copyWith(
                                          fontSize: getSize(14),
                                          color: AppColors.primaryText4,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: CustomText(
                                        text: "Order Status - ${item.status}",
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
                      ),
                    Visibility(
                      visible:bloc.isLoading,
                      child: Container(
                        color: AppColors.black.withValues(alpha: .07),
                        child: CustomLoading(),
                      ),
                    )
                  ],
                );
          }
          return const CustomLoading();
        },
      ),
    );
  }
}
