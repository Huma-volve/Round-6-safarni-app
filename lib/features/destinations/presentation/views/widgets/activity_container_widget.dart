import 'package:flutter/material.dart';

import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_styles.dart';

class ActivityContainerWidget extends StatelessWidget {
  const ActivityContainerWidget({required this.title, this.image, super.key});
  final String title;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 16, right: 8),
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
          // Image.asset(AppImages.activityImage),
          Image.network(
            image ??
                'https://png.pngtree.com/png-vector/20210604/ourmid/pngtree-gray-network-placeholder-png-image_3416659.jpg',
            width: 150,
            height: 120,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                AppImages.activityImage, // fallback من الـ assets
                width: 150,
                height: 120,
                fit: BoxFit.cover,
              );
            },
          ),
          Text(title, style: AppStyles.font15Regular),
        ],
      ),
    );
  }
}
