import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_discount.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_check_in_list.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_check_out_list.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_rate_and_review.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_review_text_field.dart';

class CustomHotelBook extends StatelessWidget {
  const CustomHotelBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [CustomDiscount(), Spacer(), CustomRateAndReview()],
            ),
            const SizedBox(height: 16),
            Text(
              'HarborHaven HIdeaway',
              style: AppStyles.textMedium20(
                context: context,
              ).copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(height: 16),
            Text(
              '1012 oscean avanue, New Yourk ,USA',
              style: AppStyles.textRegular13(
                context: context,
              ).copyWith(color: AppColors.fifthColor, height: 1.23),
            ),
            const SizedBox(height: 24),
            Container(height: .5, color: Colors.grey, width: double.infinity),
            const SizedBox(height: 16),
            Align(
              child: Text(
                'Book Hotel',
                textAlign: TextAlign.center,
                style: AppStyles.textMedium20(
                  context: context,
                ).copyWith(color: AppColors.thirdColor),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Check In',
              style: AppStyles.textMedium17(
                context: context,
              ).copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(height: 8),
            const CustomCheckINList(),
            const SizedBox(height: 24),
            Text(
              'Check Out',
              style: AppStyles.textMedium17(
                context: context,
              ).copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(height: 8),
            const CustomCheckOutList(),
            const SizedBox(height: 24),
            Text(
              'Note To Owner',
              style: AppStyles.textRegular17(
                context: context,
              ).copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(height: 8),
            CustomReviewTextField(
              maxLines: 4,
              hintText: 'Enter here',
              onChanged: (value) {},
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
