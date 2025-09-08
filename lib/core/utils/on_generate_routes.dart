import 'package:flutter/material.dart';
import 'package:safarni/feature/hotel_booking/presentation/view/hotel_booking_view.dart';
import 'package:safarni/feature/rooms/presentation/view/rooms_view.dart';

Route<dynamic> onGenerateMethod(RouteSettings settings) {
  switch (settings.name) {
    case HotelBookingView.routeName:
      return MaterialPageRoute(builder: (context) => const HotelBookingView());
    case RoomsView.routeName:
      return MaterialPageRoute(builder: (context) => const RoomsView());
    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
