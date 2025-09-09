import 'package:flutter/cupertino.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomReviewIdentification extends StatelessWidget {
  const CustomReviewIdentification({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              AppImages.imagesTest4,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.08,
              height: MediaQuery.of(context).size.width * 0.08,
            ),
            const SizedBox(width: 16),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Dale Thiel',
                textAlign: TextAlign.center,
                style: AppStyles.textMedium18.copyWith(
                  color: AppColors.ninthColor,
                ),
              ),
            ),
          ],
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '11 months ago',
            textAlign: TextAlign.center,
            style: AppStyles.textMedium13.copyWith(
              color: AppColors.seventhColor,
            ),
          ),
        ),
      ],
    );
  }
}
