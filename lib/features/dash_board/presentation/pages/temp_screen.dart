import 'package:demo/export.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});

  static Widget builder(BuildContext context) {
    logV("TempScreen");
    return const TempScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
    );
  }
}
