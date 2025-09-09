import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/features/car_booking/presentation/views/car_booking_view.dart';
import 'package:safarni/features/internal_tour/presentation/views/screens/internal_tour_view.dart';

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
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SearchPage(),

          // home: CustomBottomNavBar(),
          // color: AppColors.white,
          // onGenerateRoute: AppRouters.onGenerateRoute,
        );
      },
    );
  }
}
