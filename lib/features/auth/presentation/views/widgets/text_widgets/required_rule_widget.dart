import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/spacing/horizontal_space.dart';

class RequiredRuleWidget extends StatelessWidget {
  const RequiredRuleWidget({required this.ruleText, super.key, this.iconPath});
  final String ruleText;
  final String? iconPath;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath ?? AppIcons.assetsImagesIconsCorrectIcon),
        const HorizontalSpace(width: 16),
        Text(
          ruleText,
          style: AppStyles.poppins14px400WGray500,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
