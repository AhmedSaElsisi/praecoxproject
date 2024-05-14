import 'package:flutter/material.dart';
import 'package:praecoxproject/style/app_colors.dart';

class NoteAddTaskButton extends StatelessWidget {
  const NoteAddTaskButton({super.key , required this.label ,required this.onTap});
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        width: 110,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppTheme.basieColor
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white
          ),
          ),
        ),
      ),
    );
  }
}
