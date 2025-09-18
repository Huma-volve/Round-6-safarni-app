import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/custom_cached_network_image.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_discount.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_location.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_rate.dart';
import 'package:safarni/features/rooms/presentation/view/rooms_view.dart';

class CustomSecondHotelBookingSectionItem extends StatelessWidget {
  const CustomSecondHotelBookingSectionItem({
    required this.hotelsEntity,
    super.key,
  });
  final HotelsEntity hotelsEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RoomsView.routeName,
          arguments: hotelsEntity,
        );
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
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .175,
                child: CustomCachedNetworkImage(image: hotelsEntity.image),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomHotelDiscount(hotelsEntity: hotelsEntity),

                    CustomRate(hotelsEntity: hotelsEntity),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  hotelsEntity.name,
                  style: AppStyles.textMedium16(
                    context: context,
                  ).copyWith(color: AppColors.primaryColor),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(child: CustomLocation(hotelsEntity: hotelsEntity)),
            ],
          ),
        ),
      ),
    );
  }
}
