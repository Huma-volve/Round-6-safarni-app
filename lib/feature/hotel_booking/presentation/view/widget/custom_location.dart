import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/constant/assets.dart';

class CustomLocation extends StatelessWidget {
  const CustomLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.imagesLocation),
        const SizedBox(width: 4),
        Text(
          'New York,USA',
          style: AppStyle.textRegular14.copyWith(
            height: 1.57,
            letterSpacing: -0.18,
            color: AppColors.fifthColor,
          ),
        ),
      ],
    );
  }
}
