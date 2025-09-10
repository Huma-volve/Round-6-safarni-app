import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    this.onPressed,
    this.backgroundColor,
    this.title,
    this.borderColor,
    this.titleColor,
  });
  final void Function()? onPressed;
  final Color? backgroundColor;
  final String? title;
  final Color? borderColor;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.infinity, 48.h),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
          side: BorderSide(color: borderColor ?? AppColors.primary),
        ),
        backgroundColor: backgroundColor ?? AppColors.primary,
      ),
      child: Text(
        title ?? "Sign Up",
        style: AppStyle.poppins16px600WPrimayColor.copyWith(
          color: borderColor ?? AppColors.fourthColor,
        ),
      ),
    );
    ;
  }
}
