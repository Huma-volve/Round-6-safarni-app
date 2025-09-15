import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';

class CustomTotalPrice extends StatelessWidget {
  const CustomTotalPrice({required this.roomDetailsEntity, super.key});
  final RoomDetailsEntity roomDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Total Price',
            style: AppStyles.textRegular16(
              context: context,
            ).copyWith(color: AppColors.primaryColor),
          ),
        ),
        const SizedBox(height: 8),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '\$${roomDetailsEntity.price}',
                  style: AppStyles.textSemiBold17(
                    context: context,
                  ).copyWith(color: AppColors.thirdColor),
                ),
                TextSpan(
                  text: '/night',
                  style: AppStyles.textSemiBold15(
                    context: context,
                  ).copyWith(color: AppColors.fifthColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
