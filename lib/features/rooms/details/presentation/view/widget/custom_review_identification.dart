import 'package:flutter/cupertino.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/custom_local_image.dart';
import 'package:safarni/features/rooms/details/domain/entity/review_entity.dart';

class CustomReviewIdentification extends StatelessWidget {
  const CustomReviewIdentification({required this.review, super.key});
  final ReviewEntity review;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.09,
              height: MediaQuery.of(context).size.width * 0.08,
              child: CustomPersonLocalImage(image: review.image!),
            ),
            const SizedBox(width: 16),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                review.name ?? 'UnKnown Name',
                textAlign: TextAlign.center,
                style: AppStyles.textMedium18(
                  context: context,
                ).copyWith(color: AppColors.ninthColor),
              ),
            ),
          ],
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            review.date!.substring(0, 10),
            textAlign: TextAlign.center,
            style: AppStyles.textMedium13(
              context: context,
            ).copyWith(color: AppColors.seventhColor),
          ),
        ),
      ],
    );
  }
}
