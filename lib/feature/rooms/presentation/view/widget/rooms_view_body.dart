import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_size.dart';
import 'package:safarni/core/widget/search_text_field.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/hotel_booking_section_header.dart';
import 'package:safarni/feature/rooms/presentation/view/widget/rooms_item_list.dart';

class RoomsViewBody extends StatelessWidget {
  const RoomsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.padding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [CustomSearchTextfield(), SizedBox(height: 24)],
            ),
          ),
          SliverToBoxAdapter(
            child: HotelBookingListHeader(
              title: 'Available Rooms ',
              subTitle: 'View all',
            ),
          ),

          RoomsItemList(),
        ],
      ),
    );
  }
}
