import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/rooms/details/data/model/furniture_model.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_desc.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_details_furniture_row.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({required this.roomDetailsEntity, super.key});
  final RoomDetailsEntity roomDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomDetailsFurnitureRow(
              count: roomDetailsEntity.bathroomNumber.toString(),
              furnitureModel: FurnitureModel.furniture[0],
            ),
            CustomDetailsFurnitureRow(
              count: roomDetailsEntity.capacity.toString(),
              furnitureModel: FurnitureModel.furniture[1],
            ),
            CustomDetailsFurnitureRow(
              count: roomDetailsEntity.area.toString(),
              furnitureModel: FurnitureModel.furniture[2],
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Description',
          style: AppStyles.textMedium17(
            context: context,
          ).copyWith(color: AppColors.primaryColor),
        ),
        const SizedBox(height: 8),
        Expanded(child: CustomDesc(roomDetailsEntity: roomDetailsEntity)),
      ],
    );
  }
}
