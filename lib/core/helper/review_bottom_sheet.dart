import 'package:flutter/material.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_review_bottom_sheet_data.dart';

Future<dynamic> reviewBottomSheet(
  BuildContext primeContext,
  RoomDetailsEntity roomDetailsEntity,
  HotelsEntity hotelEntity,
) {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    context: primeContext,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.7,
        minChildSize: 0.5,
        builder: (_, controller) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 24,
            right: 24,
            top: 32,
          ),
          child: CustomReviewBottomSheetData(
            primeContext: primeContext,
            controller: controller,
            roomDetailsEntity: roomDetailsEntity,
            hotelsEntity: hotelEntity,
          ),
        ),
      );
    },
  );
}
