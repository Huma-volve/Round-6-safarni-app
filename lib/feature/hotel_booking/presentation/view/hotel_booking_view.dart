import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safarni/core/utils/assets.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/widget/hotel_banking_view_body.dart';

class HotelBookingView extends StatelessWidget {
  const HotelBookingView({super.key});
  static const routeName = 'hotel_booking_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: SvgPicture.asset(Assets.imagesArrowBack)),
      ),
      body: const HotelBankingViewBody(),
    );
  }
}
