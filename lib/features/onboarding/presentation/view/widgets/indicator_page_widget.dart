import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/features/onboarding/data/onboarding_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IndicatorPageWidget extends StatelessWidget {
  const IndicatorPageWidget({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      // PageController
      count: onboardingData.length,
      effect: CustomizableEffect(
        activeDotDecoration: DotDecoration(
          width: 32.w,
          height: 8.h,
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(24),
        ),
        dotDecoration: DotDecoration(
          width: 10.w,
          height: 10.h,
          color: AppColors.gray300,
          borderRadius: BorderRadius.circular(16),
        ),
      ), // your preferred effect
      onDotClicked: (index) {},
    );
  }
}
