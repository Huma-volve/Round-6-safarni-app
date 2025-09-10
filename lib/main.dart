import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/utils/app_routers.dart';
import 'package:safarni/core/widgets/custom_bottom_nav_bar.dart';

void main() {
  runApp( DevicePreview(builder:(context) =>SafarniApp()));
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
          onGenerateRoute: AppRouters.onGenerateRoute,

        );
      },
    );
  }
}

