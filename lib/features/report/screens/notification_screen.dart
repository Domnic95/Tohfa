import '../../../export.dart';
import '../bloc/report_cubit.dart';
import '../bloc/report_state.dart';
import '../model/notification_model.dart';
import '../widget/report_screen_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<ReportCubit>(
      create: (context) => ReportCubit()..getNotification(),
      child: const NotificationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: reportScreenAppbar("Notification"),
      body: BlocBuilder<ReportCubit, ReportState>(
        builder: (context, state) {
          if (state is ReportErrorState) {
            return NoDataFoundView(
              message: state.errorMessage,
            );
          } else if (state is NotificationSuccessState) {
            List<NotificationItem> notificationList =
                (state.notificationModel ?? []);
            return notificationList.isEmpty
                ? const NoDataFoundView(
                    message: "No Notification Found",
                  )
                : ListView.separated(
                    separatorBuilder: (context, index) =>
                        getSizeBox(height: 10),
                    itemCount: notificationList.length,
                    padding: getPadding(all: 5),
                    itemBuilder: (context, index) {
                      NotificationItem item = notificationList[index];
                      return InkWell(
                        onTap: () {
                          // Show detail dialog
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              backgroundColor: AppColors.white,
                              title: Text(item.title ?? "No Title"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (item.imageUrl != null)
                                    CustomImageView(
                                      imagePath: item.imageUrl != null
                                          ? ImageConstants.ticket
                                          : null,
                                      url: item.imageUrl,
                                      height: getSize(60),
                                      width: getSize(60),
                                      fit: BoxFit.cover,
                                    ),
                                  if (item.imageUrl != null)
                                    SizedBox(
                                      height: 10,
                                    ),
                                  Text("${item.description ?? "N/A"}"),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Close"),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          padding: getPadding(all: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(getSize(4)),
                            color: AppColors.whiteText.withValues(
                                alpha: ((item.isActive ?? false) ? 0.5 : .15)),
                            border: Border.all(
                              color: Color(0xFFA5A5A5).withValues(alpha: .45),
                            ),
                          ),
                          child: Row(
                            spacing: getSize(10),
                            children: [
                              Container(
                                height: getSize(60),
                                width: getSize(60),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(getSize(4)),
                                  color:
                                      Color(0xFFFFFDFD).withValues(alpha: .34),
                                  border: Border.all(
                                    color: Color(0xFFDBA76E)
                                        .withValues(alpha: .34),
                                  ),
                                ),
                                child: Center(
                                  child: CustomImageView(
                                    imagePath: ImageConstants.ticket,
                                    height: getSize(40),
                                    width: getSize(40),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "${item.title ?? "N/A"}",
                                    style: CustomTextStyle.bodyText.copyWith(
                                      color: AppColors.primaryText3,
                                      fontSize: getSize(14),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  CustomText(
                                    text: "${item.description ?? "N/A"}",
                                    style: CustomTextStyle.bodyText.copyWith(
                                      color: AppColors.primaryText2,
                                      fontSize: getSize(14),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ))
                            ],
                          ),
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
