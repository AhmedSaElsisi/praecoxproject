import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:praecoxproject/views/on_boarding/on_boarding_screen.dart';
import '../../style/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    
    return AnimatedSplashScreen(splash:
        SafeArea(
          child: Column(
           children: [
             Container(
               padding: EdgeInsets.only(top: 120,left: 20,right: 20),
               child: Image.asset('assets/images/logo.png'),
             ),
             Text('Praecox',style: TextStyle(
                 fontSize: 48,
                 fontWeight: FontWeight.bold,
                 color: AppTheme.basieColor              ),
             ),
           ],
          ),
        ),

         nextScreen: const OnBoardingScreen(),
      splashIconSize: 500,
      duration: 8000,

      backgroundColor: Colors.white,);
  }
}
