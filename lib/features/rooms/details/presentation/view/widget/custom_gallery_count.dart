import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomGalleryCount extends StatelessWidget {
  const CustomGalleryCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Gallery',
            style: AppStyles.textMedium17.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
          TextSpan(
            text: '(200)',
            style: AppStyles.textMedium17.copyWith(color: AppColors.thirdColor),
          ),
        ],
      ),
    );
  }
}
