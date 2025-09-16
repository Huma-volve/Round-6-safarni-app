import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/spacing/horizontal_space.dart';

class BackToLoginWidget extends StatelessWidget {
  const BackToLoginWidget({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppIcons.assetsImagesIconsArrowBackInSetPass),
          const HorizontalSpace(width: 12.5),
          Text(
            AppStrings.backToLogIn,
            style: AppStyles.poppins32px600WGray900.copyWith(fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
