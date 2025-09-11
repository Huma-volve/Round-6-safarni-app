import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/features/car_booking/presentation/views/car_booking_view.dart';
import 'package:safarni/features/car_booking/presentation/views/car_details_view.dart';
import 'package:safarni/features/car_booking/presentation/views/google_map_view.dart';
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

      case AppRoutes.carDetailsScreen:
        {
          return MaterialPageRoute(builder: (_) => const CarDetailsView());
        }
      case AppRoutes.MapScreen:
        {
          return MaterialPageRoute(builder: (_) => GoogleMapView());
        }

      case AppRoutes.carbooking:
        {
          return MaterialPageRoute(builder: (_) => CarBookingView());
        }

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(backgroundColor: Colors.red),
        );
    }
  }
}
