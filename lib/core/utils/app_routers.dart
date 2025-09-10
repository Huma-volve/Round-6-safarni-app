import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/features/home/presentation/view/home_screen.dart';
import 'package:safarni/features/home/presentation/view/result_of_search_screen.dart';
import 'package:safarni/features/home/presentation/view/search_screen.dart';
import 'package:safarni/features/profile/data/models/profile_model.dart';
import 'package:safarni/features/profile/domain/entities/profile_entity.dart';
import 'package:safarni/features/profile/presentation/views/account_secuirty_view.dart';
import 'package:safarni/features/profile/presentation/views/my_booking_view.dart';
import 'package:safarni/features/profile/presentation/views/personal_information_view.dart';
import 'package:safarni/features/profile/presentation/views/profile_view.dart';

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
      case AppRoutes.profile:
        {
          return MaterialPageRoute(builder: (_) => const ProfileView());
        }
      case AppRoutes.accountSecurity:
        {
          return MaterialPageRoute(builder: (_) => const AccountSecurityView());
        }
      case AppRoutes.bookings:
        {
          return MaterialPageRoute(builder: (_) => const MyBookingView());
        }

      case AppRoutes.personalInformation:
        {
           final user = setting.arguments as ProfileEntity; // cast as your model
          return MaterialPageRoute(
            builder: (context) => PersonalInformationView(user: user),
          );
        }

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(backgroundColor: Colors.red),
        );
    }
  }
}
