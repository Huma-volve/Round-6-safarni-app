import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/feature/rooms/details/data/model/furniture_model.dart';

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
          style: AppStyle.textRegular14.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
