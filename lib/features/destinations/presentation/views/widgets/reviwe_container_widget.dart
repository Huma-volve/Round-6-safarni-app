import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/destinations/presentation/views/widgets/rating_widget.dart';

class ReviewContainerWidget extends StatelessWidget {
  const ReviewContainerWidget({super.key, this.margin});
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xffD1D3DB)),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            spacing: 16,
            children: [
              Image.asset(AppImages.userImage),
              Text(
                'Dale Thiel',
                style: AppStyles.font14Meduim.copyWith(
                  fontSize: 18,
                  color: AppColors.blackUserNameColor,
                ),
              ),
              const Spacer(),
              Text('11 months ago', style: AppStyles.font14Meduim),
            ],
          ),
          const RatingStarWidget(rating: 5),
          Text(
            'Such a dreamy place! The views were \nstunning, and the atmosphere was so \n romantic. It felt like a fairytale moment in \nthe heart of Paris.',
            style: AppStyles.font15Regular.copyWith(
              color: AppColors.blackUserNameColor,
              fontSize: 16,
            ),
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
