import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constant/assets.dart';

class LogoWidget extends StatelessWidget {
  LogoWidget({super.key, this.height, this.width});
  double? width;
  double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 136.5533905029297.h,
      width: width ?? 145.w,
      child: Image.asset(Assets.assetsImagesLogoImage),
    );
  }
}
