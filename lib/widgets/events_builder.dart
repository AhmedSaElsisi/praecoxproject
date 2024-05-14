import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../style/app_colors.dart';
import 'default_text.dart';
import '../models/event_overview_model/events_model.dart';

class EventsBuilder extends StatelessWidget {
  final EventsModel eventsModel;
  const EventsBuilder({super.key,required this.eventsModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: Container(
        height: 20.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child:
          Row(
            children: [
              SizedBox(
                height: 4.h,
              ),
              Container(
                height: 15.h,
                width: 30.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(eventsModel.image),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Padding(
                padding: EdgeInsets.only(top: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(text: eventsModel.text,fontSize: 15.sp,fontWeight: FontWeight.bold,),
                              SizedBox(height: 3.h,),
                              DefaultText(text: eventsModel.subtext,maxLines: 2,fontSize: 8.sp,color: AppTheme.textOnColor,),
                            ],
                          ),
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
