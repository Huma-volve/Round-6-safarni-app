import 'package:flutter/material.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/utils/app_style.dart';
import 'package:safarni/core/utils/assets.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/custom_discount.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/custom_location.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/custom_rate.dart';
import 'package:safarni/feature/rooms/presentation/view/rooms_view.dart';

class CustomSecondHotelBookingSectionItem extends StatelessWidget {
  const CustomSecondHotelBookingSectionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoomsView.routeName);
      },
      child: Container(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [BoxShadow(color: Color(0x3F6F6F6F), blurRadius: 20)],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.imagesTest1, fit: BoxFit.fill),
              const SizedBox(height: 8),
              const Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [CustomDiscount(), CustomRate()],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'OasisOverture',
                style: AppStyle.textMedium16.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(height: 8),
              const Expanded(child: CustomLocation()),
            ],
          ),
        ),
      ),
    );
  }
}
