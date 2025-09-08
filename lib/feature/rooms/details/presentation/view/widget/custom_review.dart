import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/constant/assets.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_review_identification.dart';

class CustomReview extends StatelessWidget {
  const CustomReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomReviewIdentification(),
        const SizedBox(height: 8),
        Row(
          children: List.generate(
            5,
            (index) => SvgPicture.asset(Assets.iconsRate, width: 24),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'I really enjoyed my stay—the room was clean, the staff were friendly, and everything I needed was nearby.',
          style: AppStyle.textRegular16.copyWith(color: AppColors.ninthColor),
        ),
      ],
    );
  }
}
