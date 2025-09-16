import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/app_routers.dart';
import 'package:safarni/core/utils/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await sl<CacheHelper>().init();
  runApp(const SafarniApp());
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  final storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
}

class SafarniApp extends StatelessWidget {
  const SafarniApp({super.key});
  

  // This widget is the root of your application.
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
          initialRoute: RoutesNames.splash,
        );
      },
     
    );
  }
}
/*
flutter_assets:
  assets_path: assets/images/
  output_path: lib/core/utils/
  filename: assets.dart

  field_prefix: null
 */