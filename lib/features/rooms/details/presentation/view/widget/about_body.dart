import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/rooms/details/data/model/furniture_model.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_desc.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_details_furniture_row.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: FurnitureModel.furniture.asMap().entries.map((e) {
            return CustomDetailsFurnitureRow(furnitureModel: e.value);
          }).toList(),
        ),
        const SizedBox(height: 24),
        Text(
          'Description',
          style: AppStyles.textMedium17(
            context: context,
          ).copyWith(color: AppColors.primaryColor),
        ),
        const SizedBox(height: 8),
        const Expanded(child: CustomDesc()),
      ],
    );
  }
}
