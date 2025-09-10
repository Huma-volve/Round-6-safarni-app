import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/core/constant/app_style.dart';

class OtpSendAgainWidget extends StatelessWidget {
  const OtpSendAgainWidget({super.key, this.onTap});

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppStrings.otpNot,
                style: AppStyle.poppins14px500WGray800,
              ),
              TextSpan(
                text: AppStrings.sendAgain,
                style: AppStyle.poppins16px600WPrimayColor.copyWith(
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
