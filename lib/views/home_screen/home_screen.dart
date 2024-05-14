
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:praecoxproject/views/Settings/settingsscreen.dart';
import 'package:sizer/sizer.dart';
import '../../medicants_screen/VeryMildDemented/verymilddementedscreen1.dart';
import '../../models/event_overview_model/events_model.dart';
import '../../models/overviewcard_model/overview_card_model.dart';
import '../../style/app_colors.dart';
import '../../widgets/default_container_small.dart';
import '../../widgets/default_text.dart';
import '../../widgets/events_builder.dart';
import '../../widgets/overview_card_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppTheme.transparent,
              elevation: 0.0,
              title: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DefaultText(
                    text: 'hello,',
                    color: AppTheme.black,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (e) => const PatientProfile(),
                      //   ),
                      // );
                    },

                    child:const Text(
                      'Mr. Ahmed', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.basieColor,
                    ),
                    ),
                  ),
                ],
              ),
              actions: [
                GestureDetector(
                  onTap: () {},
                  child: Image.asset("assets/images/Button.png"),
                ),
                const SizedBox( width: 15,),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset("assets/images/Notification.png"),
                ),
                const SizedBox( width: 15,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsScreen(),
                      ),
                   );
                  },
                  child: Image.asset("assets/images/settings2.png"),
                ),
                const SizedBox( width: 15,),


              ],
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultText(
                      text: 'Upcoming Appointment',
                      fontSize: 10.sp,
                      color: AppTheme.text2OnColor,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Container(
                        height: 20.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/Memphis Mini Pattern.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                          // color: Colors.amber,
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 4.h,
                              ),
                              Container(
                                height: 12.h,
                                width: 16.w,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                      image:
                                      AssetImage(
                                          'assets/images/Ellipse 7.png'),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              // SizedBox(
                              //   width:5 ,
                              // ),
                              Padding(
                                padding: EdgeInsets.only(top: 3.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: [
                                    Row(children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: DefaultText(
                                              text: 'Doctor Name',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                left: 5.0),
                                            child: DefaultText(
                                              text: 'Department',
                                              color: AppTheme.text2OnColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 32.w,
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Iconsax.setting_3),
                                      ),
                                    ]),
                                    SizedBox(
                                      height: 3.5.h,
                                    ),
                                    Row(
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.only(
                                              left: 10.0),
                                          child: DefaultContainerSmall(
                                            child: Icon(
                                              Iconsax.call_outgoing,
                                              color: AppTheme.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 1.5.w,
                                        ),
                                        const DefaultContainerSmall(
                                          child: Icon(
                                            Iconsax.call_outgoing,
                                            color: AppTheme.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15.w,
                                        ),
                                        SizedBox(
                                          height: 7.h,
                                          width: 30.w,
                                          child: ElevatedButton(
                                            onPressed: () {},
                                            style: ButtonStyle(
                                                shape: MaterialStateProperty
                                                    .all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                    BorderRadius.circular(15),
                                                  ),
                                                ),
                                                backgroundColor:
                                                MaterialStateProperty.all(
                                                    AppTheme.basieColor)),
                                            child: DefaultText(
                                              text: 'Message',
                                              color: AppTheme.white,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    DefaultText(
                      text: 'Overview',
                      fontSize: 10.sp,
                      color: AppTheme.text2OnColor,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: SizedBox(
                        height: 22.5.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (e) => VeryMildDementedScreen()
                                    )
                                );
                              },
                              child: OverviewCardBuilder(
                                overviewCardModel: itemOverviewCardModel[0],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                              //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const DailyCareScreen()));
                              },
                              child: OverviewCardBuilder(
                                overviewCardModel: itemOverviewCardModel[1],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const DailyCareScreen()));
                              },
                              child: OverviewCardBuilder(
                                overviewCardModel: itemOverviewCardModel[2],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Container(
                        height: 14.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/Background.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(top: 0.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 11.h,
                                width: 14.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppTheme.cared4),
                                child: Image.asset('assets/images/Icon4.png'),
                              ),
                              SizedBox(
                                width: 2.h,
                              ),
                              DefaultText(
                                  text: 'Cognitive Booster',
                                  fontSize: 10.sp,
                                  color: AppTheme.white),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    DefaultText(
                      text: 'Events',
                      fontSize: 10.sp,
                      color: AppTheme.text2OnColor,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    SizedBox(
                      height: 40.h,
                      child: ListView.separated(
                        // scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            SizedBox(
                              height: 2.h,
                            ),
                        itemCount: itemEventsModel.length,
                        itemBuilder: (context, index) {
                          return EventsBuilder(
                            eventsModel: itemEventsModel[index],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: DefaultText(
                          text: 'Browse more',
                          fontSize: 10.sp,
                          color: AppTheme.text2OnColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    DefaultText(
                      text: 'News',
                      fontSize: 10.sp,
                      color: AppTheme.text2OnColor,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      height: 25.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppTheme.white),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 3.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 5.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppTheme.redAccent2),
                                  child: const Center(
                                      child: DefaultText(
                                        text: 'Press Release',
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.darkDed,
                                      )),
                                ),
                                SizedBox(
                                  width: 40.w,
                                ),
                                DefaultText(
                                  text: 'July 20, 2023',
                                  fontSize: 8.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.text2OnColor,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            DefaultText(
                              text:
                              'Advancements in Treatment, Diagnosis and Risk Reduction Strategies Highlighted at Alzheimer’s Association International Conference',
                              fontSize: 10.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          );
  }
}
