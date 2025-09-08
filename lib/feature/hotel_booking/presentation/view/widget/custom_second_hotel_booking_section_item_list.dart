import 'package:flutter/material.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/custom_second_hotel_booking_section_item.dart';

class CustomSecondHotelBookingSectionItemList extends StatelessWidget {
  const CustomSecondHotelBookingSectionItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(right: 16),
          child: CustomSecondHotelBookingSectionItem(),
        ),
      ),
    );
  }
}
