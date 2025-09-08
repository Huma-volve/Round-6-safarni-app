import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';

class CustomDesc extends StatelessWidget {
  const CustomDesc({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard du ',
            style: AppStyle.textRegular14.copyWith(
              height: 1.50,
              color: AppColors.fifthColor,
            ),
          ),
          TextSpan(
            text: '....Read More ',
            style: AppStyle.textRegular14.copyWith(
              height: 1.50,
              color: AppColors.thirdColor,
            ),
          ),
        ],
      ),
    );
  }
}
