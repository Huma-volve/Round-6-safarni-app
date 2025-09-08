import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/utils/app_colors.dart';

class AppStyles {
  static TextStyle poppins24px700WPrimayColor = TextStyle(
    fontFamily: FontFamilyNames.poppins,
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    color: AppColors.primary,
  );
  static TextStyle poppins16px600WPrimayColor = TextStyle(
    fontFamily: FontFamilyNames.poppins,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
}

class FontFamilyNames {
  static String poppins = "Poppins";
}
