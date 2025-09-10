import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/features/home/presentation/view/home_screen.dart';
import 'package:safarni/features/home/presentation/view/result_of_search_screen.dart';
import 'package:safarni/features/home/presentation/view/search_screen.dart';
import 'package:safarni/features/hotel_booking/presentation/view/hotel_booking_view.dart';
import 'package:safarni/features/rooms/details/presentation/view/details_view.dart';
import 'package:safarni/features/rooms/presentation/view/rooms_view.dart';

class AppRouters {
  static Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.homeScreen:
        {
          return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      case AppRoutes.searchScreen:
        {
          return MaterialPageRoute(builder: (_) => const SearchScreen());
        }
      case AppRoutes.resultSearchScreen:
        {
          final title = setting.arguments.toString();
          return MaterialPageRoute(
            builder: (_) => ResultOfSearchScreen(title: title),
          );
        }
      case HotelBookingView.routeName:
        return MaterialPageRoute(
          builder: (context) => const HotelBookingView(),
        );
      case RoomsView.routeName:
        return MaterialPageRoute(builder: (context) => const RoomsView());
      case DetailsView.routeName:
        return MaterialPageRoute(builder: (context) => const DetailsView());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(backgroundColor: Colors.red),
        );
    }
  }
}
