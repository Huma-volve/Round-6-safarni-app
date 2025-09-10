import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_cal_count.dart';

class CustomAgeListTile extends StatelessWidget {
  const CustomAgeListTile({
    required this.title,
    required this.subTitle,
    super.key,
  });
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppStyles.textMedium18.copyWith(color: AppColors.primaryColor),
      ),
      subtitle: Text(
        subTitle,
        style: AppStyles.textMedium18.copyWith(color: AppColors.seventhColor),
      ),
      trailing: const CustomCalCount(),
    );
  }
}
