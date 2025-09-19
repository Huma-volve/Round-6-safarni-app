import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

// class SeeMoreButtonWidget extends StatelessWidget {
//   const SeeMoreButtonWidget({required this.numberOfReviwes, super.key});
//   final int? numberOfReviwes;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       margin: const EdgeInsets.only(right: 16, left: 16, bottom: 24),
//       padding: const EdgeInsets.all(16),

//       decoration: BoxDecoration(
//         color: AppColors.white,
//         border: Border.all(color: AppColors.blue700Color),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Text(
//         numberOfReviwes == 0 ? 'No Reviews' : 'See More',
//         style: AppStyles.font12SemiBold.copyWith(
//           color: AppColors.blue700Color,
//           fontSize: 16,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }

class SeeMoreButtonWidget extends StatelessWidget {
  final int? numberOfReviwes;
  final bool showAll;

  const SeeMoreButtonWidget({
    super.key,
    this.numberOfReviwes,
    required this.showAll,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 16, left: 16, bottom: 24),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.blue700Color),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        (numberOfReviwes == 0 || numberOfReviwes == null)
            ? 'No Reviews'
            : (showAll ? 'See Less' : 'See More'),
        style: AppStyles.font12SemiBold.copyWith(
          color: AppColors.blue700Color,
          fontSize: 16,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
