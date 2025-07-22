
import '../../export.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final Widget? child;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.child,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        backgroundColor: color ?? AppColors.primaryColor.withValues(alpha: .7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(getSize(30)),
        ),
        minimumSize: Size(getSize(80), getSize(45)),
        maximumSize: Size(getSize(200), getSize(45)),
      ),
      onPressed: onPressed,
      child: Center(
        child: child ??
            CustomText(
              text: text,
              style: CustomTextStyle.headingText.copyWith(
                color: textColor ?? AppColors.whiteText,
                fontSize: getSize(18)
              ),
            ),
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final VoidCallback onPressed;

  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          shadowColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: Size(double.infinity, getSize(50)),
        ),
        onPressed: onPressed,
        child: icon);
  }
}
