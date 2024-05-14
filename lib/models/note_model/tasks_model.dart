import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Task{
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  num? left;
  num? done;
  bool isLast;
  Task({this.iconData,this.title,this.bgColor,this.iconColor,this.btnColor,this.done,this.left,this.isLast=false});
  static List<Task>generateTaks(){
    return[
      Task(
        iconData: Icons.person_rounded,
        title: 'Personal',
        bgColor: Colors.yellowAccent,
        iconColor:  Colors.black,
        btnColor: Colors.green,
        left: 3,
        done: 1
      )
    ];
  }
}