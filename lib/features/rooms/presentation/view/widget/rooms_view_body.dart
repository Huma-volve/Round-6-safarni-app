import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_size.dart';
import 'package:safarni/core/widgets/search_text_field.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/hotel_booking_section_header.dart';
import 'package:safarni/features/rooms/domain/entity/rooms_entity.dart';
import 'package:safarni/features/rooms/presentation/view/widget/rooms_item_list.dart';

class RoomsViewBody extends StatefulWidget {
  const RoomsViewBody({required this.hotelsEntity, super.key});
  final HotelsEntity hotelsEntity;

  @override
  State<RoomsViewBody> createState() => _RoomsViewBodyState();
}

class _RoomsViewBodyState extends State<RoomsViewBody> {
  List<RoomsEntity> rooms = [];
  List<RoomsEntity> filteredList = [];
  void handleReviewList(List<RoomsEntity> loadedList) {
    setState(() {
      rooms = loadedList;
      filteredList = loadedList;
    });
  }

  void searchAboutItem(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        filteredList = rooms;
      } else {
        filteredList = rooms
            .where(
              (element) =>
                  element.price.toLowerCase().contains(keyword.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.padding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomSearchTextfield(onChanged: searchAboutItem),
                const SizedBox(height: 24),
              ],
            ),
          ),
          const SliverToBoxAdapter(
            child: HotelBookingListHeader(
              title: 'Available Rooms ',
              subTitle: 'View all',
            ),
          ),

          RoomsItemList(
            rooms: filteredList,
            hotelsEntity: widget.hotelsEntity,
            onItemTap: handleReviewList,
          ),
        ],
      ),
    );
  }
}
