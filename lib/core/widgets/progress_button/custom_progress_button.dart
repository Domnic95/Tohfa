import 'package:demo/core/widgets/progress_button/progress_button.dart';
import '../../../export.dart';
import 'icon_custom_button.dart';

Widget customProgressButton(
    {ButtonState? buttonState,
    Function? onPressed,
    String? buttonText,
      Color? buttonColor,
    String? buttonSuccessText,
    EdgeInsetsGeometry? padding}) {
  return ProgressButton.icon(

    maxWidth: width,
    minWidth: getHorizontalSize(55.0),
    radius: buttonState != ButtonState.loading ? getSize(8) : getSize(100),
    textStyle:CustomTextStyle.bodyText.copyWith(
      color: Colors.white,
      fontSize: getSize(16),
      fontWeight: FontWeight.w700,
    ),
    iconCustomButton: {
      ButtonState.idle: IconCustomButton(
        text: buttonText ?? 'Submit',

        icon:  Icon(
          Icons.send,
          color: buttonColor??Colors.transparent,
          size: 0,
        ),

        color: buttonColor??AppColors.primaryColor,
      ),
      ButtonState.loading: IconCustomButton(
        text: "Loading",
        color: AppColors.primaryColor,
      ),
      ButtonState.fail: IconCustomButton(
        text: "Failed",
        icon: const Icon(Icons.cancel, color: Colors.white),
        color: AppColors.red,
      ),
      ButtonState.success: IconCustomButton(
        text: buttonSuccessText ?? 'Success',
        icon: const Icon(
          Icons.send,
          color: Colors.transparent,
          size: 0,
        ),
        color: AppColors.green,
      ),
    },
    onPressed: (){
      if(onPressed != null && (buttonState==ButtonState.fail||buttonState==ButtonState.idle)){
        onPressed();
      }
    },
    state: buttonState,
  );
}
