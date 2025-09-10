import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/routes_names.dart';
import 'package:safarni/core/utils/on_generate_routes.dart';

void main() {
  runApp(SafarniApp());
  // DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) => SafarniApp(), // Wrap your app
  // ),
}

class SafarniApp extends StatelessWidget {
  const SafarniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.white),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesNames.onboarding,
        onGenerateRoute: OnGenerateRoutes.onGenerateMethod,
      ),
    );
  }
}
