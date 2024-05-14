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
        Column(
          children: [
            Center(child: LottieBuilder.asset('assets/lottie/Animation - 1695301288233.json')),
            const Text('Praecox App',style: TextStyle(
              color: AppTheme.basieColor,
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),),
          ],


        ),

         nextScreen: const OnBoardingScreen(),
      splashIconSize: 500,
      duration: 8000,

      backgroundColor: Colors.white,);
  }
}
