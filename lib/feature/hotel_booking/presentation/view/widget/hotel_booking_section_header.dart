import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';

class HotelBookingListHeader extends StatelessWidget {
  const HotelBookingListHeader({
    required this.title,
    required this.subTitle,
    super.key,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppStyle.textMedium17.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              subTitle,
              style: AppStyle.textMedium15.copyWith(
                color: AppColors.sixthColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}
