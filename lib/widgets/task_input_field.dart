import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:praecoxproject/style/app_colors.dart';
import 'package:praecoxproject/style/theme.dart';

class TaskInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;
  const TaskInputField({super.key, required this.title,required this.hint,this.controller,this.widget});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 16),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleStyle,
          ),
          Container(
            height: 52,
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.only(left: 14),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppTheme.grey,
                width: 1.0
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget==null?false:true,
                    autofocus: false,
                    cursorColor: AppTheme.basieColor,
                    controller: controller,
                    style: subTitleStyle,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: subTitleStyle,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: context.theme.backgroundColor,
                          width: 0
                        ),
                      ),
                    ),

                  ) ,
                ),
                widget==null?Container():Container(child: widget,)
              ],
            ),
          ),
        ],
      ),

    );
  }
}
