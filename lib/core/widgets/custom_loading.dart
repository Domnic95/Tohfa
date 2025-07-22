
import '../../export.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: getMargin(top: 5, bottom: 5),
        height: getVerticalSize(25),
        width: getVerticalSize(25),
        child: CircularProgressIndicator(
          strokeWidth: getSize(3.5),
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
