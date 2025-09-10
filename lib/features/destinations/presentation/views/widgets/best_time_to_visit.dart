import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class BestTimeToVisiteContainer extends StatelessWidget {
  const BestTimeToVisiteContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 40),
      padding: const EdgeInsets.all(8),

      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xffD1D3DB)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        'Spring (April-June) and fall (September-October) \noffer pleasant weather and fewer crowds, ideal for\n exploring the city\'s attractions.',
        style: AppStyles.font15Regular.copyWith(
          color: AppColors.grey600,
          fontSize: 14,
        ),
        maxLines: 5,
      ),
    );
  }
}
