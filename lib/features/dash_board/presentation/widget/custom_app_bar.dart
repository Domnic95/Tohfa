
import '../../../../export.dart';

class CustomAppBar extends AppBar {
  final VoidCallback? onPressed;
  final bool? showCenterTitle;
  final Widget? leadingWidget;
  final Widget? customTitle;
  final List<Widget>? actionsList;

  CustomAppBar(String title,
      {super.key,
        this.onPressed,
        this.showCenterTitle,
        this.actionsList,
        this.customTitle,
        this.leadingWidget})
      : super(
    // systemOverlayStyle: SystemUiOverlayStyle(
    //     systemNavigationBarColor:  AppColors.primaryColor,
    //     systemNavigationBarIconBrightness:
    //     Brightness.light,
    //     statusBarBrightness: Brightness.dark,
    //     statusBarColor: AppColors.primaryColor,
    //     statusBarIconBrightness: Brightness.light),
    // backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0,
    shadowColor: Colors.transparent,
    foregroundColor: Colors.transparent,
    leadingWidth: 40,
    titleSpacing: 0,
    leading: leadingWidget,
    actions: actionsList,
    centerTitle: showCenterTitle ?? false,
    title: customTitle ??
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.white,
          ),
        ),
  );
}
