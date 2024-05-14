import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../style/app_colors.dart';

class DefaultContainerSmall extends StatelessWidget {
  final Widget child;
  const DefaultContainerSmall({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      width: 9.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.black,
      ),
      child: child,
    );
  }
}
