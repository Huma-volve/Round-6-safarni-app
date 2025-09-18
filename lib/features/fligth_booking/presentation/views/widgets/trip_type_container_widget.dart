import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class TripTypeContainerWidget extends StatelessWidget {
  const TripTypeContainerWidget({
    required this.text,

    required this.icon,
    required this.isSelected,
    required this.onTap,

    super.key,
    this.margin,
  });
  final EdgeInsetsGeometry? margin;
  final String text;

  final String icon;

  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: margin,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blue50Color : AppColors.grey100Color,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          spacing: 8,
          children: [
            SvgPicture.asset(
              icon,
              color: isSelected ? AppColors.blue700Color : AppColors.grey900,
            ),
            Text(
              text,
              style: AppStyles.font14Meduim.copyWith(
                color: isSelected ? AppColors.blue700Color : AppColors.grey900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
