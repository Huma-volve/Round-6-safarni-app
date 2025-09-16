import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/widgets/custom_bottom_nav_bar.dart';
import 'package:safarni/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:safarni/features/auth/presentation/views/check_your_email_view.dart';
import 'package:safarni/features/auth/presentation/views/froget_password_view.dart';
import 'package:safarni/features/auth/presentation/views/get_started_view.dart';
import 'package:safarni/features/auth/presentation/views/login_view.dart';
import 'package:safarni/features/auth/presentation/views/password_reset_view.dart';
import 'package:safarni/features/auth/presentation/views/set_new_password_view.dart';
import 'package:safarni/features/auth/presentation/views/sign_up_view.dart';
import 'package:safarni/features/auth/presentation/views/widgets/forms/forget_form_widget.dart';
import 'package:safarni/features/car_booking/presentation/views/car_booking_view.dart';
import 'package:safarni/features/car_booking/presentation/views/car_details_view.dart';
import 'package:safarni/features/car_booking/presentation/views/google_map_view.dart';
import 'package:safarni/features/destinations/presentation/views/pages/destantion_screen.dart';
import 'package:safarni/features/filter/presentation/view/filter_screen.dart';
import 'package:safarni/features/fligth_booking/presentation/views/pages/boarding_pass.dart';
import 'package:safarni/features/fligth_booking/presentation/views/pages/choose_seats_view.dart';
import 'package:safarni/features/fligth_booking/presentation/views/pages/flight_booking_view.dart';
import 'package:safarni/features/fligth_booking/presentation/views/pages/select_flight_view.dart';
import 'package:safarni/features/home/presentation/view/home_screen.dart';
import 'package:safarni/features/result_search/presentation/views/result_of_search_screen.dart';
import 'package:safarni/features/home/presentation/view/search_screen.dart';
import 'package:safarni/features/my_bookings/presentation/pages/my_booking_view.dart';
import 'package:safarni/features/profile/data/models/profile_model.dart';
import 'package:safarni/features/internal_tour/presentation/views/screens/internal_tour_view.dart';
import 'package:safarni/features/internal_tour/presentation/views/widgets/custom_list_view.dart';
import 'package:safarni/features/payment/presentation/views/pages/payment_data_view.dart';
import 'package:safarni/features/payment/presentation/views/pages/payment_success.dart';
import 'package:safarni/features/payment/presentation/views/pages/payment_view.dart';
import 'package:safarni/features/profile/domain/entities/profile_entity.dart';
import 'package:safarni/features/profile/domain/usecases/delete_account.dart';
import 'package:safarni/features/profile/presentation/cubits/delete_account_cubit.dart';
import 'package:safarni/features/profile/presentation/views/account_secuirty_view.dart';
import 'package:safarni/features/profile/presentation/views/personal_information_view.dart';
import 'package:safarni/features/profile/presentation/views/profile_view.dart';
import 'package:safarni/features/hotel_booking/presentation/view/hotel_booking_view.dart';
import 'package:safarni/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:safarni/features/rooms/details/presentation/view/details_view.dart';
import 'package:safarni/features/rooms/presentation/view/rooms_view.dart';
import 'package:safarni/features/splash/presentation/splash_view.dart';

class AppRouters {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case RoutesNames.splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case RoutesNames.getStarted:
        return MaterialPageRoute(builder: (context) => const GetStartedView());
      case RoutesNames.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginView(),
          ),
        );
      case RoutesNames.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SignUpView(),
          ),
        );
      case RoutesNames.checkOtp:
        final email = settings.arguments as String?;

        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: CheckYourEmailView(email: email),
          ),
        );
      case RoutesNames.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const FrogetPasswordView(),
          ),
        );
      case RoutesNames.setNewPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const SetNewPasswordView(),
          ),
        );
      case RoutesNames.passwordResetView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const PasswordResetView(),
          ),
        );
      case AppRoutes.customButtomNavBar:
        return MaterialPageRoute(
          builder: (context) => const CustomBottomNavBar(),
        );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case AppRoutes.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      case AppRoutes.internalTour:
        return MaterialPageRoute(builder: (_) => const SearchPage());
      case AppRoutes.flightBookingRouteName:
        return MaterialPageRoute(builder: (_) => const FligthBookingView());

      case AppRoutes.resultSearchScreen:
        final title = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => ResultOfSearchScreen(title: title ?? "Egypt"),
        );

      case AppRoutes.filterScreen:
        final selectedLocation = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (_) => FilterScreen(selectedLocation: selectedLocation),
        );

      case AppRoutes.hotelBooking:
        return MaterialPageRoute(builder: (_) => const HotelBookingView());

      case RoomsView.routeName:
        return MaterialPageRoute(builder: (_) => const RoomsView());

      case DetailsView.routeName:
        return MaterialPageRoute(builder: (_) => const DetailsView());

      case AppRoutes.profile:
        {
          return MaterialPageRoute(builder: (_) => ProfileView());
        }
      case AppRoutes.accountSecurity:
        {
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => DeleteAccountCubit(sl<DeleteAccountUseCase>()),
              child: const AccountSecurityView(),
            ),
          );
        }
      case AppRoutes.myBookings:
        {
          return MaterialPageRoute(builder: (_) => const MyBookingView());
        }

      case AppRoutes.personalInformation:
        {
          final user = settings.arguments as Map<String, dynamic>?;
          return MaterialPageRoute(
            builder: (context) => PersonalInformationView(user: user),
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

      case AppRoutes.destantionRouteName:
        {
          return MaterialPageRoute(builder: (_) => DestantionView());
        }

      case AppRoutes.carbooking:
        {
          return MaterialPageRoute(builder: (_) => CarBookingView());
        }
      case AppRoutes.paymentRouteName:
        {
          return MaterialPageRoute(builder: (_) => PaymentView());
        }
      case AppRoutes.paymentDataRouteName:
        {
          return MaterialPageRoute(builder: (_) => PaymentDataView());
        }
      case AppRoutes.paymentSuccessRouteName:
        {
          return MaterialPageRoute(builder: (_) => PaymentSuccessView());
        }

      case AppRoutes.selectFligthRouteName:
        {
          return MaterialPageRoute(builder: (_) => SelectFlightView());
        }
      case AppRoutes.chooseSeatsRouteName:
        {
          return MaterialPageRoute(builder: (_) => ChooseSeatsView());
        }
      case AppRoutes.boardingPassRouteName:
        {
          return MaterialPageRoute(builder: (_) => BoardingPassView());
        }
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("404 - Page not found"))),
        );
    }
  }
}
