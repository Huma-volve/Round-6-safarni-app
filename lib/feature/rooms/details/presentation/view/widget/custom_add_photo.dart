import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/constant/assets.dart';

class CustomAddPhoto extends StatelessWidget {
  const CustomAddPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.iconsCamera, fit: BoxFit.fill),
        const SizedBox(width: 8),
        Text(
          'add Photo',
          style: AppStyle.textMedium15.copyWith(color: AppColors.thirdColor),
        ),
      ],
    );
  }
}
