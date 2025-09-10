import 'package:flutter/material.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_third_hotel_booking_section_item.dart';

class CustomThirdHotelBookingSectionItemList extends StatelessWidget {
  const CustomThirdHotelBookingSectionItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: CustomThirdHotelBookingSectionItem(),
        ),
        childCount: 10,
      ),
    );
  }
}
