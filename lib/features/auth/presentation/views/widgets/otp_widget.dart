import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:safarni/core/constants/app_colors.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.onCompleted,
    this.validator,
  });
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onCompleted;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      enableActiveFill: true,
      validator: validator,
      length: 5,
      controller: controller,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        inactiveColor: AppColors.primary,
        selectedColor: Colors.red,
        activeColor: Colors.green,
        fieldHeight: 50.h,
        fieldWidth: 50.w,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
      ),
      onChanged: onChanged,
      onCompleted: onCompleted,
    );
  }
}
