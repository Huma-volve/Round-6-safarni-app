import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/constant/assets.dart';

class CustomEditReviewHeader extends StatelessWidget {
  const CustomEditReviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.iconsEdit, fit: BoxFit.fill),
        const SizedBox(width: 8),
        Text(
          'add Review',
          style: AppStyle.textMedium15.copyWith(color: AppColors.thirdColor),
        ),
      ],
    );
  }
}
