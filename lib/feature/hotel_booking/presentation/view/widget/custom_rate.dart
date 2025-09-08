import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/constant/assets.dart';

class CustomRate extends StatelessWidget {
  const CustomRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(Assets.iconsRate, fit: BoxFit.fill),
        const SizedBox(width: 4),
        Text(
          '4.5',
          style: AppStyle.textSemiBold12.copyWith(color: AppColors.fifthColor),
        ),
      ],
    );
  }
}
