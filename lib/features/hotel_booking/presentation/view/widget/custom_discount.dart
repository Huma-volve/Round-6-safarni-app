import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';

class CustomRoomDiscount extends StatelessWidget {
  const CustomRoomDiscount({required this.discount, super.key});
  final String discount;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFEBF5FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: FittedBox(
          child: Text(
            discount == '0' ? 'No avaliable discount' : '$discount%Off',
            style: AppStyles.textMedium12(
              context: context,
            ).copyWith(color: AppColors.thirdColor),
          ),
        ),
      ),
    );
  }
}

class CustomHotelDiscount extends StatelessWidget {
  const CustomHotelDiscount({required this.hotelsEntity, super.key});
  final HotelsEntity hotelsEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFEBF5FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: FittedBox(
          child: Text(
            'No avaliable discount',
            style: AppStyles.textMedium12(
              context: context,
            ).copyWith(color: AppColors.thirdColor),
          ),
        ),
      ),
    );
  }
}
