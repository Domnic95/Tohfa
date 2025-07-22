
import 'package:demo/core/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../export.dart';

class NoDataFoundView extends StatelessWidget {
  final String? message;
  const NoDataFoundView({super.key,  this.message});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      physics: myScrollView,
      slivers: [
        SliverFillRemaining(

            hasScrollBody: false,
            child: Center(
              child:  CustomText(
                textAlign: TextAlign.center,
                text: message ??
                    AppStrings.somethingWentWrong,
               style: CustomTextStyle.normalText.copyWith(
                 color: AppColors.primaryColor,
                 fontWeight: FontWeight.w500,
                 fontSize: getSize(15)
              ),
            ))
        )
      ],
    );
  }
}
