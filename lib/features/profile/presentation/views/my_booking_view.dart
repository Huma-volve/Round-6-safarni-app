import 'package:flutter/material.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_car_tab.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_flight_tab.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_hotel_tab.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_tab.dart';
import 'package:safarni/features/profile/presentation/widgets/custom_tours_tab.dart';

class MyBookingView extends StatelessWidget {
  const MyBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Booking'),

          bottom: PreferredSize(
            preferredSize: const Size(436, 42),
            child: Container(
              width: 436,
              height: 42,
              padding: EdgeInsets.zero,
              child: TabBar(
                isScrollable: true,
                dividerColor: Colors.white,
                padding: EdgeInsets.zero,
                labelPadding: const EdgeInsets.symmetric(vertical: 8),
                labelColor: const Color(0xFF1A56DB),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFEBF5FF),
                ),
                tabs: const [
                  CustomTabItem(icon: Icons.flight, label: 'Flights'),
                  CustomTabItem(icon: Icons.directions_car, label: 'car'),
                  CustomTabItem(icon: Icons.tour, label: 'Tours'),
                  CustomTabItem(icon: Icons.hotel, label: 'Hotel'),
                ],
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [FlightTab(), CarsTab(), ToursTab(), HotelTab()],
        ),
      ),
    );
  }
}
