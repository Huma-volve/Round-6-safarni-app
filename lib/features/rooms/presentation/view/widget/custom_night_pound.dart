import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/rooms/domain/entity/rooms_entity.dart';

class CustomNightPound extends StatelessWidget {
  const CustomNightPound({required this.roomsEntity, super.key});
  final RoomsEntity roomsEntity;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'From ',
            style: AppStyles.textSemiBold12(
              context: context,
            ).copyWith(color: AppColors.fifthColor),
          ),
          TextSpan(
            text: '${roomsEntity.price}\$',
            style: AppStyles.textSemiBold13(
              context: context,
            ).copyWith(color: AppColors.sixthColor),
          ),
          TextSpan(
            text: ' Per Night',
            style: AppStyles.textSemiBold12(
              context: context,
            ).copyWith(color: AppColors.fifthColor),
          ),
        ],
      ),
    );
  }
}
