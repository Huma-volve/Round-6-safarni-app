import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/core/constant/app_style.dart';

class SafarniTextWidget extends StatelessWidget {
  const SafarniTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        AppStrings.safarni,
        style: AppStyle.poppins16px600WPrimayColor.copyWith(fontSize: 34.sp),
      ),
    );
  }
}
