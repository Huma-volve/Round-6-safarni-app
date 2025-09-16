import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/custom_cached_network_image.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/rooms/details/presentation/view/details_view.dart';
import 'package:safarni/features/rooms/domain/entity/rooms_entity.dart';
import 'package:safarni/features/rooms/presentation/view/widget/custom_night_pound.dart';

class RoomsItem extends StatelessWidget {
  const RoomsItem({
    required this.roomsEntity,
    required this.hotelsEntity,
    super.key,
  });
  final RoomsEntity roomsEntity;
  final HotelsEntity hotelsEntity;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsView.routeName,
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
                height: MediaQuery.sizeOf(context).height * .13,
                width: double.infinity,
                child: CustomCachedNetworkImage(image: roomsEntity.image),
              ),
              const SizedBox(height: 8),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Room_${roomsEntity.id}',
                  style: AppStyles.textMedium16(
                    context: context,
                  ).copyWith(color: AppColors.primaryColor),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(child: CustomNightPound(roomsEntity: roomsEntity)),
            ],
          ),
        ),
      ),
    );
  }
}
