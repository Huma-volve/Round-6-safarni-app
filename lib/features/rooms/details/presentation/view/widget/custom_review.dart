import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/rooms/details/domain/entity/review_entity.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_review_identification.dart';

class CustomReview extends StatelessWidget {
  const CustomReview({required this.review, super.key});
  final ReviewEntity review;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomReviewIdentification(review: review),
        const SizedBox(height: 8),
        RatingBar.builder(
          minRating: 1,
          ignoreGestures: true,
          initialRating: review.rate ?? 0,
          allowHalfRating: true,
          itemBuilder: (context, _) =>
              const Icon(Icons.star, color: Colors.amber),
          onRatingUpdate: (rating) {},
        ),
        const SizedBox(height: 8),
        Text(
          review.desc ?? '',
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: AppStyles.textRegular16(
            context: context,
          ).copyWith(color: AppColors.ninthColor),
        ),
      ],
    );
  }
}
