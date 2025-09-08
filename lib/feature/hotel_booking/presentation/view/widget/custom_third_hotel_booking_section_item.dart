import 'package:flutter/material.dart';
import 'package:safarni/core/utils/app_colors.dart';
import 'package:safarni/core/utils/app_style.dart';
import 'package:safarni/core/utils/assets.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/custom_discount.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/custom_location.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/custom_rate.dart';
import 'package:safarni/feature/rooms/presentation/view/rooms_view.dart';

class CustomThirdHotelBookingSectionItem extends StatelessWidget {
  const CustomThirdHotelBookingSectionItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoomsView.routeName);
      },
      child: Container(
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x1E838BB4),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.imagesTest2, fit: BoxFit.fill),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [CustomDiscount(), CustomRate()],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'GoldenValley',
                      style: AppStyle.textMedium16.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const CustomLocation(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
