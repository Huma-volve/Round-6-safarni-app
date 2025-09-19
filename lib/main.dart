import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/core/constants/scripts_keys.dart';
import 'package:safarni/features/rooms/details/domain/entity/gallery_entity.dart';
import 'package:safarni/features/rooms/details/domain/entity/review_entity.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/di/get_it.dart';
import 'package:safarni/core/utils/app_routers.dart';
import 'package:safarni/core/utils/cache_helper.dart';
import 'core/utils/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await sl<CacheHelper>().init();
  await Hive.initFlutter();
  await di.init();

  Stripe.publishableKey = ScriptKeys.puplishableKey;

  Stripe.publishableKey = ScriptKeys.puplishableKey;
  Hive.registerAdapter(ReviewEntityAdapter());
  await Hive.openBox<ReviewEntity>('review');
  Hive.registerAdapter(GalleryEntityAdapter());
  await Hive.openBox<GalleryEntity>('gallery');
  await setupGetIt();
  runApp(const SafarniApp());
  AndroidOptions getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
  final storage = FlutterSecureStorage(aOptions: getAndroidOptions());
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

          color: AppColors.white,
          onGenerateRoute: AppRouters.onGenerateRoute,
          initialRoute: RoutesNames.splash,
        );
      },
    );
  }
}
