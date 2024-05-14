import 'package:flutter/material.dart';
import 'package:praecoxproject/style/app_colors.dart';

class GoPremium extends StatelessWidget {
  const GoPremium({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child:Stack(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppTheme.basieColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Icon(Icons.star,color: AppTheme.basieColor,size: 20,),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                      shape:BoxShape.circle
                  ),
                ),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Go Premium',style: TextStyle(
                    fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.white
                    ),
                    ),
                    SizedBox(height: 10,),
                    Text('Get unlimited access\n to all our features!',style:
                      TextStyle(
                       fontSize: 16,
                       color: Colors.grey
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            bottom: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(Icons.arrow_forward,color: AppTheme.basieColor,),
            ),
          )
        ],
      )
    );
  }
}
