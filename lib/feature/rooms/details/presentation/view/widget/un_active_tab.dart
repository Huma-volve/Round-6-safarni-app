import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';

class UnActiveTab extends StatelessWidget {
  const UnActiveTab({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: AppStyle.textRegular15.copyWith(color: AppColors.primaryColor),
    );
  }
}
