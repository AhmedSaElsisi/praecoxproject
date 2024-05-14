import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:praecoxproject/style/app_colors.dart';
import 'package:praecoxproject/widgets/go_Premium.dart';
import 'package:praecoxproject/widgets/tasks.dart';

class NoteHomePage extends StatelessWidget {
  const NoteHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.white,
        elevation: 0,
        title: Row(
          children: [
            Container(
              height: 45,
              width:45,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset("assets/images/avatar.jpg"),
              ),
            ),
            SizedBox(width: 10,),
            Text('Hi, Hana!',style: TextStyle(
              color: AppTheme.black,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            ),
          ],
        ),
        actions: [
          Icon(Icons.more_vert,
            color: AppTheme.black,
            size: 40,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GoPremium(),
          Container(
            padding: EdgeInsets.all(15),
            child: Text('Tasks',style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),),
          ),
          Expanded(child: Tasks())
        ],
      ),
    );
  }
}
