import '../../../../../export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static Widget builder(BuildContext context) {
    return const SplashScreen();
  }

  ///Navigation to the next screen after 3 seconds
  void navigateToNextScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (Singleton.instance.userData == null) {
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.sendOtpScreen);
      } else {
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.dashBoardScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    navigateToNextScreen(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: CustomImageView(
          height: getSize(60),
          // width:
          imagePath: ImageConstants.appLogo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
