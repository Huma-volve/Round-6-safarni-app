// import 'package:flutter/material.dart';
// import 'package:safarni/feature/hotel_booking/presentation/view/hotel_booking_view.dart';
// import 'package:safarni/feature/rooms/details/presentation/view/details_view.dart';
// import 'package:safarni/feature/rooms/presentation/view/rooms_view.dart';

import 'package:flutter/material.dart';

Route<dynamic> onGenerateMethod(RouteSettings settings) {
  switch (settings.name) {
    // case HotelBookingView.routeName:
    //   return MaterialPageRoute(builder: (context) => const HotelBookingView());
    // case RoomsView.routeName:
    //   return MaterialPageRoute(builder: (context) => const RoomsView());
    // case DetailsView.routeName:
    //   return MaterialPageRoute(builder: (context) => const DetailsView());

    default:
      return MaterialPageRoute(builder: (context) => Container());
  }
}
