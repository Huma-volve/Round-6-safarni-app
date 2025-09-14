import 'package:flutter/material.dart';
import 'package:safarni/core/helper/custom_app_bar.dart';
import 'package:safarni/features/hotel_booking/presentation/view/widget/hotel_banking_view_body.dart';

class HotelBookingView extends StatelessWidget {
  const HotelBookingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context),
      body: const HotelBankingViewBody(),
    );
  }
}
