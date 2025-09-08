import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_colors.dart';

class CustomAnimatedDivider extends StatelessWidget {
  const CustomAnimatedDivider({required this.currentIndex, super.key});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(height: .5, color: Colors.grey, width: double.infinity),
        AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          alignment: currentIndex == 0
              ? Alignment.centerLeft
              : currentIndex == 1
              ? Alignment.center
              : Alignment.centerRight,
          child: Container(
            height: 2,
            width: MediaQuery.of(context).size.width * .2,
            color: AppColors.sixthColor,
          ),
        ),
      ],
    );
  }
}
