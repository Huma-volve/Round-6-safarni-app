import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_discount.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_check_in_list.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_check_out_list.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_rate_and_review.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_review_text_field.dart';

class CustomHotelBook extends StatelessWidget {
  const CustomHotelBook({
    required this.primeContext,
    required this.discount,
    required this.averageRating,
    required this.hotelsEntity,
    required this.onCheckInChanged,
    required this.onCheckOutChanged,
    super.key,
  });
  final BuildContext primeContext;
  final String discount;
  final String averageRating;
  final HotelsEntity hotelsEntity;
  final ValueChanged<String> onCheckInChanged;
  final ValueChanged<String> onCheckOutChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomRoomDiscount(discount: discount),
                const Spacer(),
                CustomRateAndReview(
                  primeContext: primeContext,
                  averageRating: averageRating,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              hotelsEntity.name,
              style: AppStyles.textMedium20(
                context: context,
              ).copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(height: 16),
            Text(
              hotelsEntity.location,
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
            CustomCheckINList(
              onChanged: (value) {
                onCheckInChanged(value);
              },
            ),
            const SizedBox(height: 24),
            Text(
              'Check Out',
              style: AppStyles.textMedium17(
                context: context,
              ).copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(height: 8),
            CustomCheckOutList(
              onChanged: (value) {
                onCheckOutChanged(value);
              },
            ),
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
