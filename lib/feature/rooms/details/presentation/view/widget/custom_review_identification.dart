import 'package:flutter/cupertino.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/constant/assets.dart';

class CustomReviewIdentification extends StatelessWidget {
  const CustomReviewIdentification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(Assets.imagesTest4, fit: BoxFit.fill),
            const SizedBox(width: 16),
            Text(
              'Dale Thiel',
              textAlign: TextAlign.center,
              style: AppStyle.textMedium18.copyWith(
                color: AppColors.ninthColor,
              ),
            ),
          ],
        ),
        Text(
          '11 months ago',
          textAlign: TextAlign.center,
          style: AppStyle.textMedium13.copyWith(color: AppColors.seventhColor),
        ),
      ],
    );
  }
}
