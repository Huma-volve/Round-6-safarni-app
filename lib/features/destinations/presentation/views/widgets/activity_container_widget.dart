import 'package:flutter/material.dart';

import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_styles.dart';

class ActivityContainerWidget extends StatelessWidget {
  const ActivityContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 16, right: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        spacing: 8,
        children: [
          Image.asset(AppImages.activityImage),
          Text('Sunset Bike Ride', style: AppStyles.font15Regular),
        ],
      ),
    );
  }
}
