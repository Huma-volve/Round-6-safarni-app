import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_icons.dart';

class RatingStarWidget extends StatelessWidget {
  const RatingStarWidget({required this.rating, super.key});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rating,
      itemSize: 16,
      unratedColor: const Color(0xffFCBA42),
      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, index) {
        if (rating >= index + 1) {
          return SvgPicture.asset(AppIcons.starFillIcon);
        } else if (rating > index && rating < index + 1) {
          return SvgPicture.asset(AppIcons.halfStarIcon);
        } else {
          return SvgPicture.asset(AppIcons.starIcon);
        }
      },
      onRatingUpdate: (newRating) {},
    );
  }
}
