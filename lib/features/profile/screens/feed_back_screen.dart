import 'package:demo/core/widgets/custom_button.dart';
import 'package:demo/export.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/widgets/custom_drop_down.dart';
import '../../../core/widgets/ratting_bar/rating_bar.dart';
import '../../report/widget/report_screen_appbar.dart';
import '../bloc/feed_back_cubit/feed_back_cubit.dart';
import '../bloc/feed_back_cubit/feed_back_state.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedBackCubit()..getTopics(),
      child: FeedBackScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    String? selectedTopic;
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController ratting = TextEditingController(text: "0.0");
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: reportScreenAppbar("Feedback"),
      body: BlocConsumer<FeedBackCubit, FeedBackState>(
        listener: (context, state) async {
          final bloc = context.read<FeedBackCubit>();
          if (bloc.isSubmit) {
            await _showNormalDialog(context);
            NavigatorService.goBack();
          }
        },
        builder: (context, state) {
          final bloc = context.read<FeedBackCubit>();
          if (state is FeedBackSuccessState || state is FeedBackLoading) {
            return Stack(
              children: [
                SingleChildScrollView(
                  padding: getPadding(all: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: getSize(15),
                    children: [
                      CustomImageView(
                        imagePath: ImageConstants.feedbacks1,
                      ),
                      StatefulBuilder(builder: (context, setState) {
                        return customDropDown2(
                          bloc.topics,
                          (p0) => p0,
                          onChanged: (value) {
                            setState(() {
                              selectedTopic = value;
                            });
                          },
                          customLabel: SizedBox(),
                          hintText: "Select Topic",
                          enabled: bloc.topics.isNotEmpty,
                          valueText: selectedTopic,
                          disableMessage:
                              bloc.topics.isEmpty ? "No Topics Found" : null,
                          labelText: "",
                        );
                      }),
                      AppTextField(
                        labelText: "Describe your feedback",
                        minLines: 6,
                        maxLines: 6,
                        padding: getPadding(all: 10),
                        controller: descriptionController,
                        hintText: "Enter feedback",
                        // customLabel: SizedBox(),
                        withOutLabel: false,
                      ),
                      Column(
                        spacing: getSize(10),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "Rate your experience",
                            style: CustomTextStyle.headingText.copyWith(
                                color: Color(0xFF848382),
                                fontSize: getSize(12)),
                          ),
                          RatingBar2.builder(
                            initialRating: 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            glow: false,
                            itemSize: getSize(20),
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color(0xFF565656),
                              size: getSize(18),
                            ),
                            // unratedColor: AppColors.whiteText,
                            onRatingUpdate: (rating) {
                              ratting.text = rating.toString();
                            },
                          )
                        ],
                      ),
                      getSizeBox(),
                      Center(
                        child: CustomButton(
                            text: "Submit",
                            color: Colors.black.withValues(alpha: .4),
                            onPressed: () {
                              if (selectedTopic == null) {
                                HapticFeedback.vibrate();
                                showToast("Please select topic");
                                return;
                              } else if (descriptionController.text
                                  .trim()
                                  .isEmpty) {
                                HapticFeedback.vibrate();
                                showToast("Please describe your feedbacks");
                                return;
                              } else if (double.parse(ratting.text) == 0.0) {
                                HapticFeedback.vibrate();
                                showToast("Please rate your experience");
                                return;
                              } else {
                                bloc.submitFeedBacks(selectedTopic!,
                                    descriptionController.text, ratting.text);
                              }
                            }),
                      )
                    ],
                  ),
                ),
                Visibility(
                  visible: state is FeedBackLoading,
                  child: Container(
                    color: AppColors.black.withValues(alpha: .07),
                    child: CustomLoading(),
                  ),
                )
              ],
            );
          } else if (state is FeedBackErrorState) {
            return NoDataFoundView(
              message: state.error,
            );
          } else {
            return CustomLoading();
          }
        },
      ),
    );
  }

  Future<void> _showNormalDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // Start a timer to close the dialog after 3 seconds
        Future.delayed(const Duration(seconds: 3), () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          }
        });
        return Dialog(
          backgroundColor: AppColors.whiteText,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              getSizeBox(height: 40),
              CustomImageView(
                imagePath: ImageConstants.appLogo,
                // height: getSize(60),
                fit: BoxFit.cover,
                width: getSize(170),
              ),
              getSizeBox(height: 20),
              CustomImageView(
                imagePath: ImageConstants.feedbacks2,
                height: getSize(95),
                width: getSize(95),
                fit: BoxFit.cover,
              ),
              getSizeBox(height: 10),
              Column(
                children: [
                  CustomText(
                    textAlign: TextAlign.center,
                    text: "Thank you for your",
                    style: CustomTextStyle.normalText.copyWith(
                        color: Color(0xFF3F3F3F),
                        fontWeight: FontWeight.w400,
                        fontSize: getSize(14)),
                  ),
                  CustomText(
                    textAlign: TextAlign.center,
                    text: "FEEDBACK!",
                    style: CustomTextStyle.normalText.copyWith(
                        color: Color(0xFF3F3F3F),
                        fontWeight: FontWeight.w400,
                        fontSize: getSize(16)),
                  ),
                ],
              ),
              getSizeBox(height: 10),
              CustomText(
                textAlign: TextAlign.center,
                text: "Your response has been sent!",
                style: CustomTextStyle.normalText.copyWith(
                    color: Color(0xFF737373),
                    fontWeight: FontWeight.w400,
                    fontSize: getSize(14)),
              ),
              getSizeBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
