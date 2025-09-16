import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/spacing/horizontal_space.dart';

class RequiredRuleWidget extends StatelessWidget {
  const RequiredRuleWidget({
    required this.ruleText,
    super.key,
    this.iconPath,
    this.color,
    this.ruleCorrect = false,
  });
  final String ruleText;
  final String? iconPath;
  final Color? color;
  final bool ruleCorrect;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (ruleCorrect == true)
            ? SvgPicture.asset(AppIcons.assetsImagesIconsGreenCorrectIcon)
            : SvgPicture.asset(AppIcons.assetsImagesIconsCorrectIcon),
        const HorizontalSpace(width: 16),
        Text(
          ruleText,
          style: AppStyles.poppins14px400WGray500.copyWith(
            color: (ruleCorrect == true) ? AppColors.green400 : null,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
