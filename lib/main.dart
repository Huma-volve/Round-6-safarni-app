import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/utils/app_routers.dart';

void main() {
  runApp(const SafarniApp());
  // runApp(DevicePreview(builder: (context) => const SafarniApp()));
}

class SafarniApp extends StatelessWidget {
  const SafarniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (_, __) {
        return MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouters.onGenerateRoute,
          initialRoute: RoutesNames.onboarding,
        );
      },
    );
  }
}
