import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';

class CustomDesc extends StatelessWidget {
  const CustomDesc({required this.roomDetailsEntity, super.key});
  final RoomDetailsEntity roomDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: roomDetailsEntity.description,
            style: AppStyles.textRegular14(context: context).copyWith(
              height: 1.50,
              color: AppColors.fifthColor,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          TextSpan(
            text: '....Read More ',
            style: AppStyles.textRegular14(
              context: context,
            ).copyWith(height: 1.50, color: AppColors.thirdColor),
          ),
        ],
      ),
    );
  }
}
