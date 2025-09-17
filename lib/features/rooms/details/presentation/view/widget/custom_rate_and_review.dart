import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/display_review_cubit/display_review_cubit.dart';

class CustomRateAndReview extends StatelessWidget {
  const CustomRateAndReview({
    required this.averageRating,
    required this.primeContext,
    super.key,
  });
  final String averageRating;
  final BuildContext primeContext;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(AppIcons.iconsRate, fit: BoxFit.fill),
        const SizedBox(width: 4),
        Text(
          '$averageRating(${primeContext.watch<DisplayReviewCubit>().count} Reviews)',
          style: AppStyles.textSemiBold14(
            context: context,
          ).copyWith(color: AppColors.fifthColor),
        ),
      ],
    );
  }
}
