import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/features/destinations/presentation/views/pages/destantion_screen.dart';
import 'package:safarni/features/fligth_booking/presentation/views/pages/boarding_pass.dart';
import 'package:safarni/features/fligth_booking/presentation/views/pages/choose_seats_view.dart';
import 'package:safarni/features/fligth_booking/presentation/views/pages/flight_booking_view.dart';
import 'package:safarni/features/fligth_booking/presentation/views/pages/select_flight_view.dart';
import 'package:safarni/features/home/presentation/view/home_screen.dart';
import 'package:safarni/features/home/presentation/view/result_of_search_screen.dart';
import 'package:safarni/features/home/presentation/view/search_screen.dart';

class AppRouters {
  static Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case AppRoutes.homeScreen:
        {
          return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      case AppRoutes.searchScreen:
        {
          return MaterialPageRoute(builder: (_) => SearchScreen());
        }
      case AppRoutes.resultSearchScreen:
        {
          final title = setting.arguments.toString();
          return MaterialPageRoute(
            builder: (_) => ResultOfSearchScreen(title: title),
          );
        }
      case AppRoutes.destantionRouteName:
        {
          return MaterialPageRoute(builder: (_) => const DestantionView());
        }
      case AppRoutes.flightBookingRouteName:
        {
          return MaterialPageRoute(builder: (_) => const FligthBookingView());
        }
      case AppRoutes.selectFligthRouteName:
        {
          return MaterialPageRoute(builder: (_) => const SelectFlightView());
        }

      case AppRoutes.chooseSeatsRouteName:
        {
          return MaterialPageRoute(builder: (_) => const ChooseSeatsView());
        }
      case AppRoutes.boardingPassRouteName:
        {
          return MaterialPageRoute(builder: (_) => const BoardingPassView());
        }
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(backgroundColor: Colors.red),
        );
    }
  }
}
