import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/rooms/details/presentation/view/manager/display_gallery/display_gallery_cubit.dart';

class CustomGalleryCount extends StatelessWidget {
  const CustomGalleryCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Gallery',
            style: AppStyles.textMedium17(
              context: context,
            ).copyWith(color: AppColors.primaryColor),
          ),
          TextSpan(
            text: '(${context.watch<DisplayGalleryCubit>().count})',
            style: AppStyles.textMedium17(
              context: context,
            ).copyWith(color: AppColors.thirdColor),
          ),
        ],
      ),
    );
  }
}
