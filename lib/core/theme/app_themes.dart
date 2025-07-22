import '../../export.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    fontFamily: "Plus Jakarta Sans",
    scaffoldBackgroundColor: AppColors.backGroundColor,
    appBarTheme: appBarTheme(),
    timePickerTheme: TimePickerThemeData(
      cancelButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.primaryColor),
      ),
      confirmButtonStyle: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(AppColors.primaryColor),
      ),
      backgroundColor: AppColors.backGroundColor,
      dialHandColor: AppColors.primaryColor,
      hourMinuteColor: AppColors.white,
      dayPeriodColor: AppColors.primaryColor,
      dayPeriodTextColor: AppColors.grey.withOpacity(.6),
      dialBackgroundColor: AppColors.white,
      dialTextColor: AppColors.grey.withOpacity(.6),
      entryModeIconColor: AppColors.primaryColor,
      hourMinuteTextColor: AppColors.grey.withOpacity(.6),
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
      ),
    ),
    textButtonTheme:
        const TextButtonThemeData(style: ButtonStyle(splashFactory: NoSplash.splashFactory)),
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
            shadowColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            backgroundColor: AppColors.primaryColor,
            elevation: 0)),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: AppColors.primaryColor.withOpacity(.3),
      selectionHandleColor: AppColors.primaryColor,
      cursorColor: AppColors.primaryColor,
    ),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: AppColors.primaryColor,
    scrolledUnderElevation: 0,
    elevation: 0,
    centerTitle: true,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: CustomTextStyle.headingText.copyWith(color: Colors.white),
    // systemOverlayStyle: SystemUiOverlayStyle(
    //   statusBarBrightness: Brightness.light,
    //   systemNavigationBarIconBrightness: Brightness.dark,
    //   systemNavigationBarColor: AppColors.backGroundColor,
    //   systemNavigationBarDividerColor: AppColors.transparent,
    //   statusBarColor: AppColors.primaryColor,
    //   statusBarIconBrightness: Brightness.dark,
    // )
  );
}

SystemUiOverlayStyle primaryNavigationBar() {
  return SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.backGroundColor,
    systemNavigationBarDividerColor: AppColors.transparent,
    statusBarColor: AppColors.primaryColor,
    statusBarIconBrightness: Brightness.light,
  );
}

SystemUiOverlayStyle whiteNavigationBar() {
  return SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.primaryColor,
    systemNavigationBarDividerColor: AppColors.transparent,
    statusBarColor: AppColors.primaryColor,
    statusBarIconBrightness: Brightness.light,
  );
}
