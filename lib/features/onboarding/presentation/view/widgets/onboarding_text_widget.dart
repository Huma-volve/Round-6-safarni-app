import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_styles.dart';

class OnbordingTextWidget extends StatelessWidget {
  const OnbordingTextWidget({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8.w),
      child: Text(
        text,
        style: AppStyles.poppins24px600WGray800,
        textAlign: TextAlign.center,
      ),
    );
  }
}
