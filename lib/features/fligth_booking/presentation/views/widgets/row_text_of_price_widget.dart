import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class RowTextOfPriceWidget extends StatelessWidget {
  const RowTextOfPriceWidget({
    required this.title,
    required this.price,
    super.key,
  });
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppStyles.font15Regular.copyWith(fontSize: 14)),
          Text(
            price,
            style: AppStyles.font12SemiBold.copyWith(
              fontSize: 16,
              color: AppColors.blue700Color,
            ),
          ),
        ],
      ),
    );
  }
}
