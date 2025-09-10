import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/custom_rating.dart';
import 'package:safarni/core/widgets/spacing.dart';

class AvailableTourItem extends StatelessWidget {
  final String image;
  final String title;
  final String review;
  final String price;
  final String time;
  const AvailableTourItem({
    required this.title,
    required this.image,
    required this.review,
    required this.price,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16),
      child: Container(
        height: 104.h,
        width: 343.w,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.sp),
          boxShadow: const [
            BoxShadow(color: AppColors.grey200, blurRadius: 2, spreadRadius: 1),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.sp),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                width: 88.w,
                height: 88.h,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(time, style: AppStyles.fullTourStyle),
                  const HeightSpace(height: 12),
                  Text(title, style: AppStyles.tourTitleStyle),
                  const HeightSpace(height: 12),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'From ',
                          style: AppStyles.priceTourStyle.copyWith(
                            color: AppColors.grey600,
                          ),
                        ),
                        TextSpan(
                          text: '$price\$ ',
                          style: AppStyles.priceTourStyle,
                        ),
                        TextSpan(
                          text: 'per person',
                          style: AppStyles.priceTourStyle.copyWith(
                            color: AppColors.grey600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const WidthSpace(width: 50),
            Column(children: [CustomRating(rating: review)]),
          ],
        ),
      ),
    );
  }
}
