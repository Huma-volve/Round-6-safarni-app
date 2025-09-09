import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/utils/app_routers.dart';
import 'package:safarni/core/widgets/custom_bottom_nav_bar.dart';

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
      builder: (_ , _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: CustomBottomNavBar(),
          color: AppColors.white,
          onGenerateRoute: AppRouters.onGenerateRoute,

        );
      },
    );
  }
}

