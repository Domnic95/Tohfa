import 'package:demo/export.dart';
import 'package:drop_down_search_field/drop_down_search_field.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_drop_down.dart';
import '../bloc/sign_up_cubit.dart';
import '../bloc/sign_up_state.dart';
import '../widget/allready_login_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpCubit>(
      create: (context) => SignUpCubit()..getAllCountry(getOnlyCountry: true),
      child: LocationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController pinCodeController = TextEditingController();
    final TextEditingController cou = TextEditingController();
    final SuggestionsBoxController suggestionsBoxController = SuggestionsBoxController();
    return Scaffold(
      backgroundColor: Color(0xFFF6F4F0),
      body: SafeArea(
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) async {},
          builder: (context, state) {
            final bloc = context.read<SignUpCubit>();

            return Stack(
              children: [
                Center(
                  child: SingleChildScrollView(
                    padding: getPadding(all: 26),
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
                              text: "Location",
                              style: CustomTextStyle.headingText.copyWith(fontSize: getSize(22)),
                            ),
                            customDropDownSearch(
                              // height2: getSize(47),
                              searchController: cou,
                              bloc.countryModelList,
                              (p0) => p0.countryName ?? "",
                              onChanged: (value) {
                                bloc.selectedCountry = value;
                                bloc.onValueChange();
                              },

                              // customLabel: SizedBox(),
                              hintText: "Select country",
                              valueText: bloc.selectedCountry?.countryName,
                              controller: suggestionsBoxController,
                            ),
                            AppTextField(
                              maxLength: 6,
                              inputFormatters: [
                                Validation.maxLength(maxLength: 6),
                                Validation.allowOnlyNumbers(),
                              ],
                              keyboardType: TextInputType.phone,
                              labelText: "Pin code",
                              controller: pinCodeController,
                              hintText: "Enter pin code",
                            ),
                            getSizeBox(height: 10),
                            Center(
                              child: CustomButton(
                                text: "SUBMIT",
                                onPressed: () {
                                  if (bloc.selectedCountry == null) {
                                    showToast("Please select country");
                                    HapticFeedback.vibrate();
                                  } else if (pinCodeController.text.trim().isEmpty) {
                                    showToast("Please enter pin code");
                                    HapticFeedback.vibrate();
                                  } else if (pinCodeController.text.length != 6) {
                                    showToast("Invalid pin code");
                                    HapticFeedback.vibrate();
                                  } else {
                                    bloc.submitLocation(bloc.selectedCountry?.countryName ?? "",
                                        pinCodeController.text);
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
