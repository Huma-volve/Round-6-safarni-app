import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constant/app_style.dart';

class OnbordingTextWidget extends StatelessWidget {
  const OnbordingTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 8.w),
      child: Text(
        text,
        style: AppStyle.poppins24px600WGray800,
        textAlign: TextAlign.center,
      ),
    );
  }
}
