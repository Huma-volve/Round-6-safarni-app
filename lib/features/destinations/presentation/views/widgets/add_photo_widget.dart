import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';

class AddPhotoWidget extends StatelessWidget {
  const AddPhotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        SvgPicture.asset(AppIcons.cameraIcon),
        Text(
          'add Photo',
          style: AppStyles.font14Meduim.copyWith(
            color: AppColors.blue700Color,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
