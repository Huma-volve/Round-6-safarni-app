import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomAddPhoto extends StatelessWidget {
  const CustomAddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.iconsCamera, fit: BoxFit.fill),
        const SizedBox(width: 8),
        Text(
          'add Photo',
          style: AppStyles.textMedium15.copyWith(color: AppColors.thirdColor),
        ),
      ],
    );
  }
}
