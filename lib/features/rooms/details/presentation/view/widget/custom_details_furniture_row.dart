import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/rooms/details/data/model/furniture_model.dart';

class CustomDetailsFurnitureRow extends StatelessWidget {
  const CustomDetailsFurnitureRow({required this.furnitureModel, super.key});
  final FurnitureModel furnitureModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(furnitureModel.image, fit: BoxFit.fill),
        const SizedBox(width: 8),
        Text(
          furnitureModel.name,
          style: AppStyles.textRegular14(
            context: context,
          ).copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
