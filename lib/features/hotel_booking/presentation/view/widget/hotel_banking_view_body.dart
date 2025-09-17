import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_size.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_second_hotel_booking_section_item_list.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/custom_third_hotel_booking_section_item_list.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/hotel_booking_first_section.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/hotel_booking_section_header.dart';

class HotelBankingViewBody extends StatefulWidget {
  const HotelBankingViewBody({super.key});

  @override
  State<HotelBankingViewBody> createState() => _HotelBankingViewBodyState();
}

class _HotelBankingViewBodyState extends State<HotelBankingViewBody> {
  List<HotelsEntity> hotels = [];
  List<HotelsEntity> filteredList = [];
  void handleReviewList(List<HotelsEntity> loadedList) {
    setState(() {
      hotels = loadedList;
      filteredList = loadedList;
    });
  }

  void searchAboutItem(String keyword) {
    setState(() {
      if (keyword.isEmpty) {
        filteredList = hotels;
      } else {
        filteredList = hotels
            .where(
              (element) =>
                  element.name.toLowerCase().contains(keyword.toLowerCase()),
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
            child: HotelBookingFirstSection(onChanged: searchAboutItem),
          ),
          const SliverToBoxAdapter(
            child: HotelBookingListHeader(
              title: 'Recommendation',
              subTitle: 'View all',
            ),
          ),
          SliverToBoxAdapter(
            child: CustomSecondHotelBookingSectionItemList(
              onSelected: handleReviewList,
              hotels: filteredList,
            ),
          ),
          const SliverToBoxAdapter(
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
          const CustomThirdHotelBookingSectionItemList(),
        ],
      ),
    );
  }
}
