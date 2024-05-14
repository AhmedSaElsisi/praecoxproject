import 'package:flutter/material.dart';

import '../../style/app_colors.dart';

class OverviewCardModel{
  final String image;
  final String text;
  final Color color;
  final String imagePath; // Changed type to String

  const OverviewCardModel({
    required this.image,
    required this.text,
    required this.color,
    required this.imagePath, // Changed type to String
  });
}

List<OverviewCardModel> itemOverviewCardModel=[
  OverviewCardModel(image:'assets/images/Background (1).png',text: 'Medications', color: Color(0xFFFA4D56),imagePath: 'assets/images/Icon.png'),
  OverviewCardModel(image:'assets/images/Background (1).png',text: 'Appointments', color: Color(0xFFF1C21B),imagePath: 'assets/images/Icon2.png'),
  OverviewCardModel(image:'assets/images/Background (1).png',text: 'Daily Care', color: Color(0xFF42BE65),imagePath: 'assets/images/Icon3.png'),
];