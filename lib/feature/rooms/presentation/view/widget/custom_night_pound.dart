import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';

class CustomNightPound extends StatelessWidget {
  const CustomNightPound({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'From ',
            style: AppStyle.textSemiBold12.copyWith(
              color: AppColors.fifthColor,
            ),
          ),
          TextSpan(
            text: '200\$',
            style: AppStyle.textSemiBold13.copyWith(
              color: AppColors.sixthColor,
            ),
          ),
          TextSpan(
            text: ' Per Night',
            style: AppStyle.textSemiBold12.copyWith(
              color: AppColors.fifthColor,
            ),
          ),
        ],
      ),
    );
  }
}
