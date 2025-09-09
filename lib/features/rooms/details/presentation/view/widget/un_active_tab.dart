import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class UnActiveTab extends StatelessWidget {
  const UnActiveTab({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppStyles.textRegular15.copyWith(color: AppColors.primaryColor),
    );
  }
}
