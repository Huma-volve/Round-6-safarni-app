import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/features/auth/presentation/views/get_started_view.dart';
import 'package:safarni/features/auth/presentation/views/login_view.dart';
import 'package:safarni/features/auth/presentation/views/password_reset_view.dart';
import 'package:safarni/features/auth/presentation/views/set_new_password_view.dart';
import 'package:safarni/features/auth/presentation/views/sign_up_view.dart';
import 'package:safarni/features/filter/presentation/view/filter_screen.dart';
import 'package:safarni/features/home/presentation/view/home_screen.dart';
import 'package:safarni/features/home/presentation/view/result_of_search_screen.dart';
import 'package:safarni/features/home/presentation/view/search_screen.dart';
import 'package:safarni/features/hotel_booking/domain/entity/hotels_entity.dart';
import 'package:safarni/features/hotel_booking/presentation/view/hotel_booking_view.dart';
import 'package:safarni/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:safarni/features/rooms/details/presentation/view/details_view.dart';
import 'package:safarni/features/rooms/presentation/view/rooms_view.dart';

class AppRouters {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case RoutesNames.getStarted:
        return MaterialPageRoute(builder: (context) => const GetStartedView());
      case RoutesNames.login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case RoutesNames.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case RoutesNames.setNewPassword:
        return MaterialPageRoute(
          builder: (context) => const SetNewPasswordView(),
        );
      case RoutesNames.passwordResetView:
        return MaterialPageRoute(
          builder: (context) => const PasswordResetView(),
        );

      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case AppRoutes.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      case AppRoutes.resultSearchScreen:
        final title = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => ResultOfSearchScreen(title: title ?? 'No title'),
        );

      case AppRoutes.filterScreen:
        final selectedLocation = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => FilterScreen(selectedLocation: selectedLocation),
        );

      case HotelBookingView.routeName:
        return MaterialPageRoute(builder: (_) => const HotelBookingView());

      case RoomsView.routeName:
        return MaterialPageRoute(
          builder: (_) =>
              RoomsView(hotelsEntity: settings.arguments as HotelsEntity),
        );

      case DetailsView.routeName:
        return MaterialPageRoute(
          builder: (_) =>
              DetailsView(hotelsEntity: settings.arguments as HotelsEntity),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('404 - Page not found'))),
        );
    }
  }
}
