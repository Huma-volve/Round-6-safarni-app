import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:safarni/core/constant/app_colors.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      enableActiveFill: true,
      length: 4,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        inactiveColor: AppColors.primary,
        selectedColor: Colors.grey,
        activeColor: Colors.green,
        fieldHeight: 54.h,
        fieldWidth: 65.w,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
      ),
      onChanged: (value) {},
      onCompleted: (value) {
        print("OTP: $value");
      },
    );
  }
}
