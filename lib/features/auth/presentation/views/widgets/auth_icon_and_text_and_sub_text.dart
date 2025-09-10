import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';

class AuthIconAndTextAndSubText extends StatelessWidget {
  const AuthIconAndTextAndSubText({
    required this.iconPath,
    required this.mainText,
    required this.subText,
    super.key,
  });
  final String iconPath;
  final String mainText;
  final String subText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(iconPath, height: 24.h, width: 24.w),
        const VerticalSpace(height: 24),
        Text(
          mainText,
          style: AppStyles.poppins32px600WGray900.copyWith(fontSize: 18.sp),
        ),
        const VerticalSpace(height: 16),
        Text(
          subText,
          style: AppStyles.poppins14px400WGray500,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
