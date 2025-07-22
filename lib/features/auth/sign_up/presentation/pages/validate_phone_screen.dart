import 'package:demo/core/widgets/custom_actions.dart';
import 'package:demo/core/widgets/custom_drop_down.dart';
import 'package:demo/export.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../bloc/sign_up_cubit.dart';
import '../bloc/sign_up_state.dart';
import '../widget/allready_login_widget.dart';

class ValidatePhoneScreen extends StatelessWidget {
  const ValidatePhoneScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit()..getISDCodeList(),
      child: ValidatePhoneScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: Color(0xFFF6F4F0),
      body: SafeArea(
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) async {
            final bloc = context.read<SignUpCubit>();

            if (state is SignUpErrorState) {
              await customAlert(
                context: context,
                title: CustomText(
                  text: "Alert",
                  style: CustomTextStyle.headingText.copyWith(fontSize: getSize(22)),
                ),
                content: CustomText(
                  text: state.error ?? AppStrings.somethingWentWrong,
                  style: CustomTextStyle.subtitleText.copyWith(
                    fontSize: getSize(14),
                  ),
                ),
                onSubmit: () {
                  NavigatorService.goBack();
                  bloc.onSendOptForSignUp(Singleton.instance.tempRegData);
                },
              );
            }
          },
          builder: (context, state) {
            final bloc = context.read<SignUpCubit>();

            return Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    padding: getPadding(left: 20, right: 20, top: 50, bottom: 20),
                    child: Column(
                      spacing: getSize(40),
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomImageView(
                          height: getSize(60),
                          imagePath: ImageConstants.appLogo,
                          fit: BoxFit.contain,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: getSize(10),
                          children: [
                            CustomText(
                              text: "Validate Mobile No.",
                              style: CustomTextStyle.headingText.copyWith(fontSize: getSize(22)),
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
                            getSizeBox(height: 10),
                            Center(
                              child: CustomButton(
                                text: "VALIDATE",
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
                                    bloc.validateNumber(
                                        controller.text, bloc.selectedCode?.value ?? "");
                                  }
                                },
                              ),
                            ),
                            allReadyLogin()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                    visible: state is SignUpLoadingState,
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
