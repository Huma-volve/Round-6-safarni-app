import 'package:flutter/material.dart';
import 'package:safarni/core/helper/custom_app_bar.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/hotel_banking_view_body.dart';

class HotelBookingView extends StatelessWidget {
  const HotelBookingView({super.key});
  static const routeName = 'hotel_booking_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: customAppBar(), body: const HotelBankingViewBody());
  }
}
