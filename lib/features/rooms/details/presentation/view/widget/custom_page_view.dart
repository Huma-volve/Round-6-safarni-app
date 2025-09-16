import 'package:flutter/material.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/rooms/details/domain/entity/room_details_entity.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/about_body.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/gallery_body.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/review_body.dart';

class CustomPageView extends StatelessWidget {
  const CustomPageView({
    required this.pageController,
    required this.roomDetailsEntity,
    required this.hotelEntity,
    super.key,
  });
  final RoomDetailsEntity roomDetailsEntity;
  final PageController pageController;
  final HotelsEntity hotelEntity;
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      itemCount: getPages(
        hotelEntity: hotelEntity,
        pageController,
        roomDetailsEntity: roomDetailsEntity,
      ).length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: getPages(
            hotelEntity: hotelEntity,
            pageController,
            roomDetailsEntity: roomDetailsEntity,
          )[index],
        );
      },
    );
  }
}

List<Widget> getPages(
  PageController pageController, {
  required RoomDetailsEntity roomDetailsEntity,
  required HotelsEntity hotelEntity,
}) {
  return [
    AboutBody(roomDetailsEntity: roomDetailsEntity),
    const GalleryBody(),
    ReviewBody(roomDetailsEntity: roomDetailsEntity, hotelsEntity: hotelEntity),
  ];
}
