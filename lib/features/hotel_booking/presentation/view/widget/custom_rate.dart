import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomRate extends StatelessWidget {
  const CustomRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(AppIcons.iconsRate, fit: BoxFit.fill),
        const SizedBox(width: 4),
        FittedBox(
          child: Text(
            '4.5',
            style: AppStyles.textSemiBold12(
              context: context,
            ).copyWith(color: AppColors.fifthColor),
          ),
        ),
      ],
    );
  }
}
