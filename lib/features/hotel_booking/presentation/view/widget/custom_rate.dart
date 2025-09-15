import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';

class CustomRate extends StatelessWidget {
  const CustomRate({required this.hotelsEntity, super.key});
  final HotelsEntity hotelsEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.iconsRate, fit: BoxFit.fill),
        const SizedBox(width: 4),
        FittedBox(
          child: Text(
            hotelsEntity.rating,
            style: AppStyles.textSemiBold12(
              context: context,
            ).copyWith(color: AppColors.fifthColor),
          ),
        ),
      ],
    );
  }
}
