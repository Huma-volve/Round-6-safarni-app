import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';

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
                style: AppStyles.poppins14px500WGray800,
              ),
              TextSpan(
                text: AppStrings.sendAgain,
                style: AppStyles.poppins16px600WPrimayColor.copyWith(
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
