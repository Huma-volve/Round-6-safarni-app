import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomNightPound extends StatelessWidget {
  const CustomNightPound({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'From ',
            style: AppStyles.textSemiBold12(
              context: context,
            ).copyWith(color: AppColors.fifthColor),
          ),
          TextSpan(
            text: '200\$',
            style: AppStyles.textSemiBold13(
              context: context,
            ).copyWith(color: AppColors.sixthColor),
          ),
          TextSpan(
            text: ' Per Night',
            style: AppStyles.textSemiBold12(
              context: context,
            ).copyWith(color: AppColors.fifthColor),
          ),
        ],
      ),
    );
  }
}
