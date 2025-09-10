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
    super.key,
    required this.controller,
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
        width: 290.w,
        height: 44.h,
        child: TextField(
          enabled: widget.isEnabled ?? false,
          controller: widget.controller,
          onChanged: widget.onChanged,
          autofocus: true,
          decoration: InputDecoration(
            hintText: "Search ... ",
            hintStyle: AppStyles.searchText,
            prefixIcon: Icon(
              CupertinoIcons.search,
              color: AppColors.grey400,
              size: 22.sp,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.grey200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.viewAllColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: AppColors.grey200),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormFeild extends StatelessWidget {
  CustomTextFormFeild({
    super.key,
    this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.obscurText = false,
    this.controller,
    this.validator,
    this.hintStyle,
    this.keyboardType,
    this.border,
  });

  final double? border;
  final String? hint;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  bool obscurText;
  TextEditingController? controller;
  String? Function(String?)? validator;
  TextStyle? hintStyle;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      maxLines: maxLines,
      minLines: 1,
      obscureText: obscurText,
      validator: validator,
      controller: controller,
      onChanged: onChanged,
      onSaved: onSaved,

      cursorColor: AppColors.grey600,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle ?? const TextStyle(color: AppColors.grey500Color),
        border: buildBorder(),
        enabledBorder: buildBorder(enabledBorderColor),
        focusedBorder: buildBorder(focusedBorderColor),
        errorBorder: buildBorder(AppColors.red),
        focusedErrorBorder: buildBorder(AppColors.red),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: border == null
          ? BorderRadius.circular(10)
          : BorderRadius.circular(border!),
      borderSide: BorderSide(color: color ?? AppColors.grey400),
    );
  }
}
