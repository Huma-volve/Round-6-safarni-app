import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_review_identification.dart';

class CustomReview extends StatelessWidget {
  const CustomReview({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomReviewIdentification(),
        const SizedBox(height: 8),
        Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: const EdgeInsets.only(right: 4),
              child: SvgPicture.asset(
                AppIcons.iconsRate,
                width: screenWidth * 0.05,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'I really enjoyed my stay—the room was clean, the staff were friendly, and everything I needed was nearby.',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.textRegular16(
            context: context,
          ).copyWith(color: AppColors.ninthColor),
        ),
      ],
    );
  }
}
