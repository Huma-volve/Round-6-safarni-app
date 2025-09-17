import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';

class CustomLocation extends StatelessWidget {
  const CustomLocation({required this.hotelsEntity, super.key});
  final HotelsEntity hotelsEntity;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppIcons.iconsLocation),
        const SizedBox(width: 4),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            hotelsEntity.location,
            style: AppStyles.textRegular14(context: context).copyWith(
              height: 1.57,
              letterSpacing: -0.18,
              color: AppColors.fifthColor,
            ),
          ),
        ),
      ],
    );
  }
}
