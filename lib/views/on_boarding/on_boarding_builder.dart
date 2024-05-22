import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../models/on_boarding_model/on_boarding_model.dart';
import '../../style/app_colors.dart';
import '../../widgets/default_text.dart';

class OnBoardingBuilder extends StatelessWidget {
  final OnBoarding onBoardingModel;
  const OnBoardingBuilder({super.key, required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      
          Image.asset(onBoardingModel.image),
          SizedBox(
            height: 3.h,
          ),
          DefaultText(
            text: onBoardingModel.text,
            color: AppTheme.textOnColor,
          ),
          SizedBox(
            height: 3.h,
          ),
          DefaultText(
            text: onBoardingModel.title,
            textAlign: TextAlign.center,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.textOnColor,
          ),
          DefaultText(
            text: onBoardingModel.subTitle,
            textAlign: TextAlign.center,
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: AppTheme.textOnColor,
          ),
          SizedBox(
            height: 3.h,
          ),
          DefaultText(
            text: onBoardingModel.details,
            maxLines: 3,
            textAlign: TextAlign.center,
            fontSize: 11.5.sp,
            color: AppTheme.text2OnColor,
          ),
        ],
      ),
    );
  }
}
