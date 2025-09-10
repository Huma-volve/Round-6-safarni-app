import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomEditReviewHeader extends StatelessWidget {
  const CustomEditReviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.iconsEdit, fit: BoxFit.fill),
        const SizedBox(width: 8),
        Text(
          'add Review',
          style: AppStyles.textMedium15(
            context: context,
          ).copyWith(color: AppColors.thirdColor),
        ),
      ],
    );
  }
}
