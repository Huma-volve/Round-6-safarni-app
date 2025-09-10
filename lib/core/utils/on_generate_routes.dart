// import 'package:flutter/material.dart';
// import 'package:safarni/feature/hotel_booking/presentation/view/hotel_booking_view.dart';
// import 'package:safarni/feature/rooms/details/presentation/view/details_view.dart';
// import 'package:safarni/feature/rooms/presentation/view/rooms_view.dart';

import 'package:flutter/material.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/features/auth/presentation/views/get_started_view.dart';
import 'package:safarni/features/auth/presentation/views/login_view.dart';
import 'package:safarni/features/auth/presentation/views/password_reset_view.dart';
import 'package:safarni/features/auth/presentation/views/set_new_password_view.dart';
import 'package:safarni/features/auth/presentation/views/sign_up_view.dart';
import 'package:safarni/features/onboarding/presentation/view/onboarding_view.dart';

class OnGenerateRoutes {
  static Route<dynamic> onGenerateMethod(RouteSettings settings) {
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

      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
