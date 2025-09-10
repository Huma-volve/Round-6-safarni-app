import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/widgets/custom_button_widget.dart';
import 'package:safarni/features/onboarding/data/onboarding_data.dart';

Widget buildBottomButton(
  BuildContext context, {
  required int numberPage,
  void Function()? onPressed,
}) {
  return Padding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
    child: SizedBox(
      width: double.infinity,
      child: CustomButtonWidget(
        onPressed: onPressed,
        title: (numberPage < onboardingData.length - 1)
            ? AppStrings.next
            : AppStrings.getStart,
      ),
    ),
  );
}
