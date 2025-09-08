import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constant/app_size.dart';
import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/constant/assets.dart';
import 'package:safarni/core/utils/assets.dart';
import 'package:safarni/core/widgets/spacing/horizontal_space.dart';

class SkipButtonWidget extends StatelessWidget {
  const SkipButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(AppStrings.skip, style: AppStyle.poppins16px600WPrimayColor),
        HorizontalSpace(width: AppSize.padHorizantal16),
        SvgPicture.asset(Assets.imagesIconsArrowIcon),
      ],
    );
  }
}
