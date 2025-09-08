import 'package:flutter/material.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/hotel_booking_view.dart';

Route<dynamic> onGenerateMethod(RouteSettings settings) {
  switch (settings.name) {
    case HotelBookingView.routeName:
      return MaterialPageRoute(builder: (context) => const HotelBookingView());
    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
