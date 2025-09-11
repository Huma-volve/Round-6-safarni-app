import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/constants/assets.dart';
import 'package:safarni/core/widgets/spacing/horizontal_space.dart';

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    this.onPressed,
    this.title,
    this.icon,
  });
  final void Function()? onPressed;
  final String? title;
  final String? icon;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.infinity, 48.h),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
          side: BorderSide(color: AppColors.gray300),
        ),
        backgroundColor: AppColors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon ?? Assets.assetsImagesIconsGoogleIcon,
            width: 24.w,
            height: 24.h,
          ),
          HorizontalSpace(width: 12.w),
          Text(
            title ?? 'Sign in with Google',
            style: AppStyles.poppins16px600WGray700,
          ),
        ],
      ),
    );
  }
}
