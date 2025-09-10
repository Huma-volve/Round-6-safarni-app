import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_strings.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 32.w),
            child: Divider(color: AppColors.grey800Color, thickness: 1),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 11.w),
          child: Text(
            AppStrings.or,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.grey800Color,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: 32.w),
            child: Divider(color: AppColors.grey800Color, thickness: 1),
          ),
        ),
      ],
    );
  }
}
