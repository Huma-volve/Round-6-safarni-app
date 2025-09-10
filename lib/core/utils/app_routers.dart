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
<<<<<<< HEAD
import 'package:safarni/features/payment/presentation/views/pages/payment_data_view.dart';
import 'package:safarni/features/payment/presentation/views/pages/payment_success.dart';
import 'package:safarni/features/payment/presentation/views/pages/payment_view.dart';

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
      case AppRoutes.paymentRouteName:
        {
          return MaterialPageRoute(builder: (_) => const PaymentView());
        }
      case AppRoutes.paymentDataRouteName:
        {
          return MaterialPageRoute(builder: (_) => const PaymentDataView());
        }
      case AppRoutes.paymentSuccessRouteName:
        {
          return MaterialPageRoute(builder: (_) => const PaymentSuccessView());
        }
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(backgroundColor: Colors.red),
=======
import 'package:safarni/features/hotel_booking/presentation/view/hotel_booking_view.dart';
import 'package:safarni/features/rooms/details/presentation/view/details_view.dart';
import 'package:safarni/features/rooms/presentation/view/rooms_view.dart';

class AppRouters {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case AppRoutes.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      case AppRoutes.resultSearchScreen:
        final title = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => ResultOfSearchScreen(title: title ?? "No title"),
        );

      case HotelBookingView.routeName:
        return MaterialPageRoute(builder: (_) => const HotelBookingView());

      case RoomsView.routeName:
        return MaterialPageRoute(builder: (_) => const RoomsView());

      case DetailsView.routeName:
        return MaterialPageRoute(builder: (_) => const DetailsView());

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("404 - Page not found"))),
>>>>>>> 8f774cc2fce8103e12e37e390cf7e77d9358db7a
        );
    }
  }
}
