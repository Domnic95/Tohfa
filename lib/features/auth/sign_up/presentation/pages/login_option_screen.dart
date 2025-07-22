import 'package:demo/core/widgets/custom_button.dart';

import '../../../../../export.dart';

class LoginOptionScreen extends StatelessWidget {
  const LoginOptionScreen({super.key});

  static Widget builder(BuildContext context) {
    return const LoginOptionScreen();
  }

  @override
  Widget build(BuildContext context) {
    bool isSelected = true;
    return Scaffold(
      backgroundColor: Color(0xFFF6F4F0),
      body: SafeArea(
        child: Padding(
          padding: getPadding(left: 20,right: 20,top: 50,bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              getSizeBox(),
              CustomImageView(
                height: getSize(60),
                imagePath: ImageConstants.appLogo,
                fit: BoxFit.contain,
              ),
              Column(
                spacing: getSize(40),
                children: [
                  CustomText(
                    text: "SIGN IN",
                    style: CustomTextStyle.headingText.copyWith(
                        fontSize: getSize(22)
                    ),
                  ),
                  CustomContainer(
                    onTap: () {
                      isSelected = true;
                    },
                    labelText: "Sign in with OTP",
                    prefixIcon: CustomImageView(
                      height: getSize(20),
                      imagePath: ImageConstants.mobile,
                      fit: BoxFit.contain,
                    ),
                  ),
                  CustomButton(
                    text: "SIGN IN",
                    onPressed: () {
                      if (!isSelected) {
                        showToast("Please select sign in method first");
                        HapticFeedback.vibrate();
                      }else{
                        NavigatorService.pushNamed(AppRoutes.sendOtpScreen);
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: "New user Create an account,",
                        style: CustomTextStyle.subtitleText
                            .copyWith(fontWeight: FontWeight.w500,  fontSize: getSize(14),),
                      ),
                      InkWell(
                        onTap: () {
                          NavigatorService.pushNamed(AppRoutes.sendOtpScreen);
                        },
                        child: CustomText(
                          text: "Sign up",
                          style: CustomTextStyle.subtitleText.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: getSize(16),
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryColorDark),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              getSizeBox(),
              getSizeBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatefulWidget {
  final String labelText;
  final Widget prefixIcon;
  final VoidCallback? onTap;

  const CustomContainer({
    super.key,
    required this.labelText,
    required this.prefixIcon,
    this.onTap,
  });

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  bool isTapped = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = true;
        });
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      child: Container(
        padding: getPadding(all: 15),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(getSize(8)),
          border: isTapped
              ? Border.all(color: AppColors.primaryColorDark, width: 1)
              : Border.all(
                  color: AppColors.textGrey,
                ),
        ),
        child: Row(
          spacing: getSize(10),
          children: [
            widget.prefixIcon,
            Text(
              widget.labelText,
              style: CustomTextStyle.subtitleText.copyWith(
                fontSize: getSize(14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
