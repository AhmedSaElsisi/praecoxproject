import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        dashPattern: const [10, 4],
        strokeCap: StrokeCap.round,
        color: Colors.blue.shade400,
        child: Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.blue.shade50.withOpacity(.5),
              borderRadius: BorderRadius.circular(10)),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Iconsax.folder_open,
                color: Colors.black,
                size: 40,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Select your file',
                style: TextStyle(fontSize: 15,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
