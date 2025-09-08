import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/utils/app_style.dart';
import 'package:safarni/core/utils/assets.dart';

class CustomRate extends StatelessWidget {
  const CustomRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesRate, fit: BoxFit.fill),
        const SizedBox(width: 4),
        Text(
          '4.5',
          style: AppStyle.textSemiBold12.copyWith(color: AppColors.fifthColor),
        ),
      ],
    );
  }
}
