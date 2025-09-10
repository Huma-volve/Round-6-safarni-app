import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class DateContainerWidget extends StatelessWidget {
  const DateContainerWidget({
    required this.text,
    required this.icon,
    required this.margin,
    super.key,
  });
  final String text;
  final String icon;
  final EdgeInsetsGeometry margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            spreadRadius: 1.4,
            blurRadius: 0.8,
          ),
        ],
      ),
      child: Row(
        spacing: 8,
        children: [
          SvgPicture.asset(icon),
          Text(text, style: AppStyles.font15Regular.copyWith(fontSize: 13)),
        ],
      ),
    );
  }
}
