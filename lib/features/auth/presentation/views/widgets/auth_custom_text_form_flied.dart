import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';

class AuthCustomTextFormFiled extends StatelessWidget {
  AuthCustomTextFormFiled({
    super.key,
    this.controller,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.onTap,
    this.autovalidateMode,
  });
  TextEditingController? controller;
  String? Function(String?)? validator;
  String? hintText;
  final String? prefixIcon;
  bool obscureText;
  void Function()? onTap;
  AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 44.h,
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscureText,
        obscuringCharacter: '*',
        autovalidateMode: autovalidateMode,
        decoration: InputDecoration(
          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),

          prefixIcon: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: EdgeInsets.only(
                left: 18.w,
                top: 16.h,
                right: 2.w,
                bottom: 16.h,
              ),
              child: SvgPicture.asset(
                prefixIcon ?? AppIcons.assetsImagesIconsEmailIcon,
                width: 20.w,
                height: 20.h,
              ),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColors.grey400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: Colors.red),
          ),
          hintText: hintText ?? 'kneeDue@untitledui.com',
          hintStyle: const TextStyle(
            color: AppColors.grey500,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
