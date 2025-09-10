import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

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
            style: AppStyles.textRegular14(context: context).copyWith(
              height: 1.50,
              color: AppColors.fifthColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextSpan(
            text: '....Read More ',
            style: AppStyles.textRegular14(
              context: context,
            ).copyWith(height: 1.50, color: AppColors.thirdColor),
          ),
        ],
      ),
    );
  }
}
