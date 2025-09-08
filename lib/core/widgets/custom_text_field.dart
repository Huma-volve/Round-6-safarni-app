import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  const CustomTextField({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290.w,
      height: 44.h,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Search ... ',
          hintStyle: AppStyles.searchText,
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: AppColors.grey400,
            size: 22.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.grey200),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.grey200),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(color: AppColors.grey200),
          ),
        ),
      ),
    );
  }
}
