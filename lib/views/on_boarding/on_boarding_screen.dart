
import 'package:flutter/material.dart';
import 'package:praecoxproject/views/Welcome_screen/welcome_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/on_boarding_model/on_boarding_model.dart';
import '../../style/app_colors.dart';
import '../../widgets/default_text.dart';
import 'on_boarding_builder.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;
  final controller = PageController();
  void finishOn(String screenName, BuildContext context) {
    // CashHelper.putBoolean(key: MyKeyCache.onBoarding, value: isLast);
     Navigator.of(context).pushNamedAndRemoveUntil(screenName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
          child: Column(
            children: [
              isLast ?
                Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70,
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fill,
                        height: 10.h,
                      ),
                    ),
                    DefaultText(
                      text: 'Congratulations!',
                      textAlign: TextAlign.center,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textOnColor,
                    ),
                  ],
                ) : Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/on_boarding/happiness 1.png',
          fit: BoxFit.cover,
        ),
        TextButton(
            onPressed: () {
             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const WelcomeScreen()));
            },
            child: const DefaultText(
              text: 'Skip',
              color: AppTheme.basieColor,
            )),
      ],),
              SizedBox(
                height: 73.h,
                child: PageView.builder(
                    onPageChanged: (index) {
                      if (index == itemOnBoarding.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        isLast = false;
                      }
                    },
                    scrollDirection: Axis.horizontal,
                    controller: controller,
                    itemCount: itemOnBoarding.length,
                    itemBuilder: (context, index) {
                      return OnBoardingBuilder(
                        onBoardingModel: itemOnBoarding[index],
                      );
                    }),
              ),
              SmoothPageIndicator(
                controller: controller,
                count: itemOnBoarding.length,
                effect: const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  type: WormType.thinUnderground,
                  activeDotColor: AppTheme.basieColor,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: isLast
          ? Padding(
              padding: EdgeInsets.only(right: 27.5.w),
              child: SizedBox(
                height: 7.h,
                width: 35.w,
                child: ElevatedButton(
                  onPressed: () {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const WelcomeScreen()));
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      backgroundColor:
                          MaterialStateProperty.all(AppTheme.basieColor)),
                  child: const DefaultText(text: 'Get Started',textAlign: TextAlign.center,color: AppTheme.white,),
                ),
              ),
            )
          : SizedBox(
              height: 7.h,
              child: ElevatedButton(
                onPressed: () {
                  controller.nextPage(
                      duration: const Duration(microseconds: 1000000),
                      curve: Curves.easeInOut);
                },

                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(AppTheme.basieColor)),
                child: const Icon(Icons.arrow_forward_sharp,color: Colors.white,),
              ),
            ),
    );
  }
}
