import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_size.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_button.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_total_price.dart';

import '../../../../../../core/helper/book_hotel_bottom_sheet.dart';

class CustomBookNow extends StatelessWidget {
  const CustomBookNow({
    required this.roomDetailsEntity,
    required this.primeContext,
    required this.hotelsEntity,
    super.key,
  });
  final HotelsEntity hotelsEntity;
  final RoomDetailsEntity roomDetailsEntity;
  final BuildContext primeContext;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .17,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0xFFD1D5DB),
            blurRadius: 39,
            offset: Offset(10, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSize.padding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomTotalPrice(roomDetailsEntity: roomDetailsEntity),
            ),
            const SizedBox(width: 36),
            CustomButton(
              title: 'Book now',
              onPressed: () {
                bookHotelBottomSheet(
                  roomsEntity: roomDetailsEntity,
                  hotelsEntity: hotelsEntity,
                  context,
                  primeContext: primeContext,
                  discount: roomDetailsEntity.discount,
                  averageRating: roomDetailsEntity.averageRating,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
