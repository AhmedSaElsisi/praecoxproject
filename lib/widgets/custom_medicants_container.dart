import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomMedicantContainer extends StatelessWidget {
  const CustomMedicantContainer({super.key,required this.imagePath ,required this.text1 ,required this.text2});
  final String? text1;
  final String?text2;
  final String?imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.0,
      height: 72.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath!),
          SizedBox(height: 5.0),
          Text(
            text1!,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text2!,
            style: TextStyle(
              color: Color(0xFF42BE65),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    )




    ;
  }
}
