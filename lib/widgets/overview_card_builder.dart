import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../style/app_colors.dart';
import '../models/overviewcard_model/overview_card_model.dart';
import 'default_text.dart';

class OverviewCardBuilder extends StatelessWidget {
  final OverviewCardModel overviewCardModel;
  const OverviewCardBuilder({super.key,required this.overviewCardModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20.h,
          width: 26.5.w,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(overviewCardModel.image),fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: Column(
              children: [
                Container(
                  height: 8.h,
                  width: 15.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: overviewCardModel.color
                  ),
                  child: Image.asset(overviewCardModel.imagePath, width: 5, height: 5),
                ),
                SizedBox(height: 5.h,),
                DefaultText(text: overviewCardModel.text,fontSize: 10.sp,color: AppTheme.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
