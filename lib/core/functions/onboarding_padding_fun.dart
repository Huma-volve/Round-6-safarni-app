import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/features/onboarding/data/onboarding_data.dart';

class OnboardingPaddingFun {
  static EdgeInsets pagePadding(int index) {
    if (index == 0) {
      return EdgeInsets.only(left: 4.w);
    }
    if (index == onboardingData.length - 1) {
      return EdgeInsets.only(right: 16.w);
    }
    return EdgeInsets.zero;
  }
}
