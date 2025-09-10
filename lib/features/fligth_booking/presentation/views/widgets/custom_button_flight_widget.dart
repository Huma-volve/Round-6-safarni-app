import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CutomButtonFligthWidget extends StatelessWidget {
  const CutomButtonFligthWidget({
    required this.text,
    required this.onTap,
    super.key,
    this.margin,
  });

  final String text;
  final Function() onTap;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        width: double.infinity,
        margin: margin,
        decoration: BoxDecoration(
          color: AppColors.blue700Color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppStyles.font12SemiBold.copyWith(
            color: AppColors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
