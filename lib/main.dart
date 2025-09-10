import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/utils/app_routers.dart';
import 'package:safarni/features/fligth_booking/presentation/views/pages/flight_booking_view.dart';

void main() {
  runApp(const SafarniApp());
}

class SafarniApp extends StatelessWidget {
  const SafarniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: FligthBookingView(),
          color: AppColors.white,
          onGenerateRoute: AppRouters.onGenerateRoute,
        );
      },
    );
  }
}
