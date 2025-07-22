import 'package:demo/core/widgets/custom_button.dart';

import '../../../../../core/widgets/custom_drop_down.dart';
import '../../../../../export.dart';
import '../bloc/sign_in_cubit.dart';
import '../bloc/sign_in_state.dart';
import '../widget/dont_have_account_widget.dart';

class SendOtpScreen extends StatelessWidget {
  const SendOtpScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<SignInCubit>(
      create: (context) => SignInCubit(false)..getISDCodeList(),
      child: SendOtpScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFFF6F4F0),
      body: SafeArea(
        child: BlocConsumer<SignInCubit, SignInState>(
          listener: (context, state) async {
            // if (state is SignInErrorState) {
            //   await customAlert(
            //     context: context,
            //     title: CustomText(
            //       text: "Alert",
            //       style: CustomTextStyle.headingText,
            //     ),
            //     content: CustomText(
            //       text: state.error ?? AppStrings.somethingWentWrong,
            //       style: CustomTextStyle.subtitleText,
            //     ),
            //     onSubmit: () {
            //       NavigatorService.goBack();
            //       NavigatorService.pushNamed(AppRoutes.locationScreen);
            //     },
            //   );
            // }
          },
          builder: (context, state) {
            final bloc = context.read<SignInCubit>();

            return Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    padding: getPadding(all: 26),
                    child: Column(
                      spacing: getSize(30),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomImageView(
                          height: getSize(60),
                          imagePath: ImageConstants.appLogo,
                          fit: BoxFit.contain,
                        ),
                        // getSizeBox(height: height / 15),
                        CustomText(
                          text: "Enter your mobile number \n we will send a verification code",
                          style: CustomTextStyle.subtitleText.copyWith(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w300,
                              fontSize: getSize(17)),
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          spacing: getSize(5),
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 4,
                                child: customDropDown2(
                                  height2: getSize(47),
                                  bloc.isdCodeModelList,
                                  (p0) => p0.value ?? "",
                                  onChanged: (value) {
                                    bloc.selectedCode = value;
                                    bloc.onValueChange();
                                  },
                                  customLabel: SizedBox(),
                                  valueText: bloc.selectedCode?.value,
                                )),
                            Expanded(
                              flex: 10,
                              child: AppTextField(
                                maxLength: 10,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return "Please enter phone number";
                                  } else if (value.length != 10) {
                                    return "Invalid mobile number";
                                  } else {
                                    return null;
                                  }
                                },
                                inputFormatters: [
                                  Validation.maxLength(maxLength: 10),
                                  Validation.allowOnlyNumbers(),
                                ],
                                keyboardType: TextInputType.phone,
                                labelText: "Mobile No.",
                                controller: controller,
                                hintText: "Enter mobile no.",
                              ),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: getSize(40),
                          children: [
                            getSizeBox(height: 10),
                            Center(
                              child: CustomButton(
                                text: "Sign In",
                                onPressed: () {
                                  if (bloc.selectedCode == null) {
                                    showToast("Please select ISD Code");
                                    HapticFeedback.vibrate();
                                  } else if (controller.text.trim().isEmpty) {
                                    showToast("Please enter phone number");
                                    HapticFeedback.vibrate();
                                  } else if (controller.text.length != 10) {
                                    showToast("Invalid mobile number");
                                    HapticFeedback.vibrate();
                                  } else {
                                    bloc.sendOtp(controller.text, bloc.selectedCode?.value ?? "",
                                        context: context);
                                  }
                                },
                              ),
                            ),
                            dontHaveAccount(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                    visible: state is SignInLoadingState,
                    child: Container(
                      color: AppColors.primaryColorDark.withValues(alpha: .2),
                      child: CustomLoading(),
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}
