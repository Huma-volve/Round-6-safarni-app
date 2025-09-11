import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_discount.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_add_photo.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_button.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_rate_and_review.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_review_text_field.dart';

Future<dynamic> reviewBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        minChildSize: 0.5,
        builder: (_, controller) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 24,
            right: 24,
            top: 32,
          ),
          child: SingleChildScrollView(
            controller: controller,
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
                Container(
                  height: .5,
                  color: Colors.grey,
                  width: double.infinity,
                ),
                const SizedBox(height: 16),
                Align(
                  child: Text(
                    'Your Over Rating Of This Product',
                    textAlign: TextAlign.center,
                    style: AppStyles.textRegular16(
                      context: context,
                    ).copyWith(color: AppColors.fifthColor),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: SvgPicture.asset(AppIcons.iconsRate, width: 36),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Add detailed review ',
                    style: AppStyles.textRegular17(
                      context: context,
                    ).copyWith(color: AppColors.primaryColor),
                  ),
                ),
                CustomReviewTextField(
                  hintText: 'Enter here',
                  maxLines: 5,
                  onChanged: (value) {},
                ),
                const SizedBox(height: 8),
                const SizedBox(height: 24),
                const CustomAddPhoto(),
                const SizedBox(height: 16),
                CustomButton(
                  title: 'Submit',
                  onPressed: () {},
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
