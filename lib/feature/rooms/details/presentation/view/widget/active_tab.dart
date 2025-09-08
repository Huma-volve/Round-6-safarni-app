import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';

class ActiveTab extends StatelessWidget {
  const ActiveTab({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyle.textMedium15.copyWith(color: AppColors.thirdColor),
    );
  }
}
