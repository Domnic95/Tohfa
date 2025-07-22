import 'dart:ui';

import '../../export.dart';

customDialog2(
    {required BuildContext context,
    required Widget child,
    bool barrierDismissible = true}) {
  return showDialog(
    context: context,
    useSafeArea: true,
    barrierDismissible: barrierDismissible,
    useRootNavigator: false,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: Dialog(
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        child: Padding(
          padding: getPadding(all: 15),
          child: child,
        ),
      ),
    ),
  );
}

customDialog({
  required BuildContext context,
  required Widget child,
  Color? backGroundColor,
  bool? barrierDismissible,
  double? padding,
  double? maxWidth,
  Future<bool> Function()? onWillPop,
}) {
  return showGeneralDialog(
    barrierColor: Colors.black.withOpacity(0.4),
    transitionBuilder: (context, a1, a2, widget) {
// Adjust the blur factor as needed
      return Stack(
        children: [
          // Background with blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: GestureDetector(
              onTap: () {
                NavigatorService.goBack();
              },
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          // Dialog
          SafeArea(
            child: Transform.scale(
              scale: a1.value,
              child: Padding(
                padding: getPadding(all: 20),
                child: Dialog(
                  elevation: 0,
                  surfaceTintColor: AppColors.primaryColor,
                  insetPadding: EdgeInsets.symmetric(
                    horizontal: getHorizontalSize(padding ?? 20),
                    vertical: getHorizontalSize(padding ?? 20),
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  backgroundColor: backGroundColor ?? AppColors.primaryColor,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: maxWidth ?? 400),
                    child: child,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
    transitionDuration: const Duration(milliseconds: 200),
    barrierDismissible: barrierDismissible ?? true,
    barrierLabel: '',
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return const SizedBox();
    },
  );
}

customAlert(
    {required BuildContext context,
    Widget? title,
    Widget? content,
    Widget? cancelWidget,
    Widget? confirmWidget,
    Color? backGroundColor,
    bool? barrierDismissible,
    VoidCallback? onSubmit,
    Future<bool> Function()? onWillPop}) {
  return showGeneralDialog(
      barrierColor: Colors.black.withOpacity(0.4),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(
          scale: a1.value,
          child: AlertDialog(
            backgroundColor: backGroundColor ?? AppColors.white,
            actionsPadding: getPadding(bottom: 10, right: 20, left: 20),
            contentPadding: getPadding(right: 20, left: 20, top: 8),
            title: title != null
                ? Row(
                    children: [Expanded(child: title)],
                  )
                : null,
            content: SizedBox(width: double.infinity, child: content),
            actions: <Widget>[
              cancelWidget ??
                  GestureDetector(
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                    onTap: () => NavigatorService.goBack(),
                  ),
              confirmWidget ??
                  FilledButton(
                    onPressed: onSubmit,
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.primaryColor.withValues(alpha: .7))),
                    child: CustomText(
                      text: "Continue",
                      style: CustomTextStyle.headingText.copyWith(
                          color:  AppColors.whiteText,
                          fontSize: getSize(18)
                      ),
                    ),
                  ),
            ],
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: barrierDismissible ?? true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return const SizedBox();
      });
}

Future<DateTime?> customDatePicker(
    {required BuildContext context,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? initialDate}) async {
  return await showDatePicker(
    context: context,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: firstDate ?? DateTime(2010),
    lastDate: lastDate ?? DateTime(2025),
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: AppColors.white,
              onSurface: AppColors.primaryColor,
              surface: AppColors.white),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primaryColor, // button text color
            ),
          ),
          dividerColor: AppColors.white,
        ),
        child: child!,
      );
    },
  );
}

customDialogTitle(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: title.isNotEmpty
            ? CustomText(
                text: title,
                style: CustomTextStyle.bodyText.copyWith(
                  fontSize: getSize(16),
                  fontWeight: FontWeight.w600,
                ),
              )
            : const SizedBox(),
      ),
      InkWell(
          onTap: () {
            NavigatorService.goBack();
          },
          child: Icon(
            Icons.close_rounded,
            color: AppColors.textGrey,
          ))
    ],
  );
}
