import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_size.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/spacing/horizontal_space.dart';

class SkipButtonWidget extends StatelessWidget {
  const SkipButtonWidget({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Text(AppStrings.skip, style: AppStyles.poppins16px600WPrimayColor),
          HorizontalSpace(width: AppSize.padHorizantal16),
          SvgPicture.asset(AppIcons.assetsImagesIconsArrowIcon),
        ],
      ),
    );
  }
}
