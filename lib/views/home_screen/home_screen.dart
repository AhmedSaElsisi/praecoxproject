import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:praecoxproject/cubit/doctor_register_cubit/dr_register_state.dart';
import 'package:praecoxproject/cubit/patient_login_cubit/patient_login_state.dart';
import 'package:praecoxproject/cubit/patient_register_cubit/patient_register_state.dart';
import 'package:praecoxproject/local_db/shared_preferences.dart';
import 'package:praecoxproject/views/Profile/profilescreen.dart';
import 'package:praecoxproject/views/on_boarding/on_boarding_screen.dart';
import 'package:sizer/sizer.dart';
import '../../DailyCare/MildCare/mild_care.dart';
import '../../DailyCare/ModerateDementedCare/moderate_demented_care.dart';
import '../../DailyCare/VeryMildCare/verymildcare.dart';
import '../../app/app.dart';
import '../../cubit/doctor_register_cubit/dr_register_cubit.dart';
import '../../cubit/layout_cubit/layout_cubit.dart';
import '../../cubit/patient_login_cubit/patient_login_cubit.dart';
import '../../cubit/patient_register_cubit/patient_register_cubit.dart';
import '../../medicants_screen/MildDemented/milddementedscreen.dart';
import '../../medicants_screen/ModerateDemented/moderatedementedscreen.dart';
import '../../medicants_screen/VeryMildDemented/verymilddementedscreen1.dart';
import '../../models/event_overview_model/events_model.dart';
import '../../models/overviewcard_model/overview_card_model.dart';
import '../../models/patient_login_model/patient_log_model.dart';
import '../../style/app_colors.dart';
import '../../views/Settings/settingsscreen.dart';
import '../../widgets/default_container_small.dart';
import '../../widgets/default_text.dart';
import '../../widgets/events_builder.dart';
import '../../widgets/overview_card_builder.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  String? dignosis= SharedPrefrenceHelper.getData(key: 'diagnos');

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    HomeCubit.get(context).getProfileData();
    print(widget.dignosis);

    super.initState();
  }

  void _navigateToPage(int index) {
    Widget page;
    switch (index) {
      case 0:
        page = HomeScreen(); // Assuming HomeScreen is the main screen
        break;
      case 1:
        page = OnBoardingScreen(); // Replace with actual message screen widget
        break;
      case 2:
        page = ProviderScope(
            child:
                FlutterRiverpodTodoApp()); // Replace with actual archive screen widget
        break;
      case 3:
        page = PatientProfile(); // Replace with actual settings screen widget
        break;
      default:
        page = HomeScreen();
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetDataLoading){
          CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        var cubit1 = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppTheme.transparent,
            elevation: 0.0,
            leading: Text(''),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DefaultText(
                  text: 'hello,',
                  color: AppTheme.black,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    cubit1.profileData!.data!.name!,
                    style: TextStyle(
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
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {},
                child: Image.asset("assets/images/Notification.png"),
              ),
              const SizedBox(width: 15),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()),
                  );
                },
                child: Image.asset("assets/images/settings2.png"),
              ),
              const SizedBox(width: 15),
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
                  SizedBox(height: 2.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    child: Container(
                      height: 20.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage(
                              'assets/images/Memphis Mini Pattern.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: Row(
                          children: [
                            SizedBox(height: 4.h),
                            Container(
                              height: 12.h,
                              width: 16.w,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image:
                                      AssetImage('assets/images/Ellipse 7.png'),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 3.h),
                              child: BlocConsumer<DoctorRegisterCubit,
                                  DoctorRegisterState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  var cubit = DoctorRegisterCubit.get(context);
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5.0),
                                                child: DefaultText(
                                                  text: cubit
                                                      .doctorNameRegisterController
                                                      .text,
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 5.0),
                                                child: DefaultText(
                                                  text: cubit
                                                      .doctorPhonedRegisterController
                                                      .text,
                                                  color: AppTheme.text2OnColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: 30.w),
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Iconsax.setting_3),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 3.5.h),
                                      Row(
                                        children: [
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.0),
                                            child: DefaultContainerSmall(
                                              child: Icon(
                                                Iconsax.call_outgoing,
                                                color: AppTheme.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 1.5.w),
                                          const DefaultContainerSmall(
                                            child: Icon(
                                              Iconsax.call_outgoing,
                                              color: AppTheme.white,
                                            ),
                                          ),
                                          SizedBox(width: 15.w),
                                          SizedBox(
                                            height: 7.h,
                                            width: 30.w,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                  AppTheme.basieColor,
                                                ),
                                              ),
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
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  DefaultText(
                    text: 'Overview',
                    fontSize: 10.sp,
                    color: AppTheme.text2OnColor,
                  ),
                  SizedBox(height: 4.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.w),
                    child: SizedBox(
                      height: 22.5.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (widget.dignosis == 'MildDemented') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (e) =>
                                          const MildDemntedScreen()),
                                );
                              } else if (widget.dignosis ==
                                  'VeryMildDemented') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (e) =>
                                          const VeryMildDementedScreen()),
                                );
                              } else if (widget.dignosis ==
                                  'ModerateDemented') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (e) =>
                                          const ModerateDemntedScreen()),
                                );
                              }
                            },
                            child: OverviewCardBuilder(
                              overviewCardModel: itemOverviewCardModel[0],
                            ),
                          ),
                          InkWell(
                            child: OverviewCardBuilder(
                              overviewCardModel: itemOverviewCardModel[1],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (widget.dignosis == 'MildDemented') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (e) => const MildCareScreen()),
                                );
                              } else if (widget.dignosis ==
                                  'VeryMildDemented') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (e) =>
                                          const VeryMildCareScreen()),
                                );
                              } else if (widget.dignosis ==
                                  'ModerateDemented') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (e) =>
                                          const ModerateCareScreen()),
                                );
                              }
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
                          image: AssetImage('assets/images/Background.png'),
                          fit: BoxFit.cover,
                        ),
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
                                color: AppTheme.cared4,
                              ),
                              child: Image.asset('assets/images/Icon4.png'),
                            ),
                            SizedBox(width: 2.h),
                            DefaultText(
                              text: 'Recommendation',
                              fontSize: 10.sp,
                              color: AppTheme.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  DefaultText(
                    text: 'Events',
                    fontSize: 10.sp,
                    color: AppTheme.text2OnColor,
                  ),
                  SizedBox(height: 3.h),
                  SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 2.h),
                      itemCount: itemEventsModel.length,
                      itemBuilder: (context, index) {
                        return EventsBuilder(
                            eventsModel: itemEventsModel[index]);
                      },
                    ),
                  ),
                  SizedBox(height: 3.h),
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
                  SizedBox(height: 3.h),
                  DefaultText(
                    text: 'News',
                    fontSize: 10.sp,
                    color: AppTheme.text2OnColor,
                  ),
                  SizedBox(height: 3.h),
                  Container(
                    height: 25.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppTheme.white,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 2.w, vertical: 3.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 5.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppTheme.redAccent2,
                                ),
                                child: const Center(
                                  child: DefaultText(
                                    text: 'Press Release',
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.darkDed,
                                  ),
                                ),
                              ),
                              Spacer(),
                              DefaultText(
                                text: 'July 20, 2023',
                                fontSize: 8.sp,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.text2OnColor,
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
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
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppTheme.white,
            elevation: 0,
            currentIndex: cubit1.currentIndex,
            onTap: (index) {

              cubit1.changeIndex(index);

              _navigateToPage(index);
            },
            selectedItemColor: AppTheme.basieColor,
            selectedLabelStyle: TextStyle(
              color: AppTheme.basieColor,
              fontSize: 9.sp,
              fontWeight: FontWeight.w500,
            ),
            selectedIconTheme: const IconThemeData(
              color: AppTheme.basieColor,
            ),
            unselectedItemColor: AppTheme.grey,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Iconsax.home),
                activeIcon: const Icon(Iconsax.home_15),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Iconsax.message),
                activeIcon: const Icon(Iconsax.message5),
                label: 'Messages',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Iconsax.archive_minus),
                activeIcon: const Icon(Iconsax.archive_minus5),
                label: 'Note',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Iconsax.frame_1),
                activeIcon: const Icon(Iconsax.frame5),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
