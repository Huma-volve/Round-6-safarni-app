import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/custom_rating.dart';
import 'package:safarni/core/widgets/spacing.dart';

class RecommendationItemModel extends StatelessWidget {
  final String image;
  final String title;
  final String review;
  final String location;
  const RecommendationItemModel({
    required this.title,
    required this.image,
    required this.review,
    required this.location,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 217.w,
        height: 288.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.sp),
          boxShadow: const [
            BoxShadow(color: AppColors.grey200, blurRadius: 4, spreadRadius: 2),
          ],
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: AssetImage(image),
                width: 201.w,
                height: 199.h,
                fit: BoxFit.cover,
              ),
            ),
            const HeightSpace(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: AppStyles.addressesTextStyle),
                CustomRating(rating: review),
              ],
            ),
            const HeightSpace(height: 8),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.categoryTitleColor,
                  size: 30.sp,
                ),
                Text(location, style: AppStyles.bioStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
