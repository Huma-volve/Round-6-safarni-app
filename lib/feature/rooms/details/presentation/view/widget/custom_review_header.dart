import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_size.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/custom_discount.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_edit_review_header.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_rate_and_review.dart';

class CustomReviewHeader extends StatelessWidget {
  const CustomReviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Reviews',
          style: AppStyle.textMedium17.copyWith(color: AppColors.primaryColor),
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.padding,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          CustomDiscount(),
                          Spacer(),
                          CustomRateAndReview(),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'HarborHaven HIdeaway',
                        style: AppStyle.textMedium20.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '1012 oscean avanue, New Yourk ,USA',
                        style: AppStyle.textRegular13.copyWith(
                          color: AppColors.fifthColor,
                          height: 1.23,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        height: .5,
                        color: Colors.grey,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              },
            );
          },
          child: const CustomEditReviewHeader(),
        ),
      ],
    );
  }
}
