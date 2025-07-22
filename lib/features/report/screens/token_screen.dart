import 'package:demo/export.dart';
import 'package:demo/features/report/model/token_model.dart';
import 'package:flutter/material.dart';

import '../bloc/report_cubit.dart';
import '../bloc/report_state.dart';
import '../widget/report_screen_appbar.dart';

class TokenScreen extends StatelessWidget {
  const TokenScreen({super.key});
  static Widget builder(BuildContext context) {
    return BlocProvider<ReportCubit>(
      create: (context) => ReportCubit()..getTokenList(),
      child: const TokenScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: reportScreenAppbar("Token"),
      body: BlocBuilder<ReportCubit, ReportState>(
        builder: (context, state) {
          if (state is ReportErrorState) {
            return NoDataFoundView(
              message: state.errorMessage,
            );
          } else if (state is GetTokenSuccessState) {
            final bloc = context.read<ReportCubit>();
            // List<OrderMemo> orderMemoList = state.orderMemoModel.data ?? [];
            List<TokenModel> tokenModel = state.tokenModel;
            return Stack(
              children: [
                tokenModel.isEmpty
                    ? const NoDataFoundView(
                        message: "No Token Found",
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          thickness: 0.5,
                        ),
                        itemCount: tokenModel.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: getPadding(
                                top: 4, bottom: 4, left: 8, right: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomText(
                                        text:
                                            "Token No. ${tokenModel[index].tokenNo}",
                                        style:
                                            CustomTextStyle.bodyText.copyWith(
                                          color: AppColors.primaryText3,
                                          fontSize: getSize(14),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    CustomText(
                                      text: tokenModel[index].tokenStatus ??
                                          "N/A",
                                      style: CustomTextStyle.bodyText.copyWith(
                                        fontSize: getSize(14),
                                        color: AppColors.primaryText4,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                CustomText(
                                  text:
                                      "Created - ${tokenModel[index].createdOn ?? "N/A"}",
                                  style: CustomTextStyle.bodyText.copyWith(
                                    fontSize: getSize(14),
                                    color: AppColors.primaryText4,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: CustomText(
                                        text:
                                            "Site Name - ${tokenModel[index].siteName ?? "N/A"}",
                                        style:
                                            CustomTextStyle.bodyText.copyWith(
                                          fontSize: getSize(14),
                                          color: AppColors.primaryText4,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 2),
                                      child: CustomText(
                                        text: tokenModel[index].sectionName ??
                                            "N/A",
                                        style:
                                            CustomTextStyle.bodyText.copyWith(
                                          fontSize: getSize(14),
                                          color: AppColors.primaryText4,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                Visibility(
                  visible: bloc.isLoading,
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
