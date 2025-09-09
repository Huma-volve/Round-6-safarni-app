import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class ActiveTab extends StatelessWidget {
  const ActiveTab({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.textMedium15.copyWith(color: AppColors.thirdColor),
    );
  }
}
