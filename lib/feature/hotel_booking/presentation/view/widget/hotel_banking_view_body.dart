import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_size.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/custom_second_hotel_booking_section_item_list.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/custom_third_hotel_booking_section_item_list.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/hotel_booking_first_section.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/hotel_booking_section_header.dart';

class HotelBankingViewBody extends StatelessWidget {
  const HotelBankingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.padding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: HotelBookingFirstSection()),
          SliverToBoxAdapter(
            child: HotelBookingListHeader(
              title: 'Recommendation',
              subTitle: 'View all',
            ),
          ),
          SliverToBoxAdapter(child: CustomSecondHotelBookingSectionItemList()),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 24),
                HotelBookingListHeader(
                  title: 'Nearby Hotel',
                  subTitle: 'View all',
                ),
              ],
            ),
          ),
          CustomThirdHotelBookingSectionItemList(),
        ],
      ),
    );
  }
}
