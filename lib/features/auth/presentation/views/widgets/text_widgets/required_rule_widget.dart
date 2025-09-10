import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/constant/assets.dart';
import 'package:safarni/core/widgets/spacing/horizontal_space.dart';

class RequiredRuleWidget extends StatelessWidget {
  const RequiredRuleWidget({super.key, required this.ruleText});
  final String ruleText;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.assetsImagesIconsCorrectIcon),
        const HorizontalSpace(width: 16),
        Text(ruleText, style: AppStyle.poppins14px400WGray500),
      ],
    );
  }
}
