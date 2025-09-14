import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';

import 'package:safarni/features/onboarding/presentation/view/widgets/skip_button_widget.dart';

class CustomNavWidget extends StatelessWidget {
  const CustomNavWidget({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppStrings.safarni,
            style: TextStyle(
              fontFamily: FontFamilyNames.poppins,
              fontSize: 22.sp,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
            ),
          ),

          SkipButtonWidget(onTap: onTap),
        ],
      ),
    );
  }
}
