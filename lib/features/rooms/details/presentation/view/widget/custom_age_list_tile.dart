import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_cal_count.dart';

class CustomAgeListTile extends StatelessWidget {
  const CustomAgeListTile({
    required this.title,
    required this.subTitle,
    required this.onChanged,
    super.key,
  });
  final String title, subTitle;
  final void Function(int) onChanged;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: AppStyles.textMedium18(
          context: context,
        ).copyWith(color: AppColors.primaryColor),
      ),
      subtitle: Text(
        subTitle,
        style: AppStyles.textMedium18(
          context: context,
        ).copyWith(color: AppColors.seventhColor),
      ),
      trailing: CustomCalCount(onChanged: onChanged),
    );
  }
}
