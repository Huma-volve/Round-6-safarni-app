import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';

class WelcomeBackAndSubtitleWidget extends StatelessWidget {
  const WelcomeBackAndSubtitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.welcomeAgain,
          style: AppStyles.poppins32px600WGray900.copyWith(fontSize: 18.sp),
        ),
        const VerticalSpace(height: 8),
        Text(
          AppStrings.welcomeBackPleaseFillYourData,
          style: AppStyles.poppins14px400WGray500,
        ),
      ],
    );
  }
}
