import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/helper/review_bottom_sheet.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_edit_review_header.dart';

class CustomReviewHeader extends StatelessWidget {
  const CustomReviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Reviews',
          style: AppStyles.textMedium17.copyWith(color: AppColors.primaryColor),
        ),
        InkWell(
          onTap: () {
            reviewBottomSheet(context);
          },
          child: const CustomEditReviewHeader(),
        ),
      ],
    );
  }
}
