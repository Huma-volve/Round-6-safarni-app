import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool? isEnabled;
  void Function(String)? onChanged;
  CustomTextField({
    required this.controller,
    super.key,
    this.isEnabled,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(
          context,
          rootNavigator: true,
        ).pushNamed(AppRoutes.searchScreen);
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width*.8,
        height: 44.h,
        child: TextField(
          enabled: widget.isEnabled ?? false,
          controller: widget.controller,
          onChanged: widget.onChanged,
          autofocus: true,
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
              borderSide: const BorderSide(color: AppColors.viewAllColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(color: AppColors.grey200),
            ),
          ),
        ),
      ),
    );
  }
}
