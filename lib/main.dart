import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:safarni/core/service/get_it_setup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/utils/app_routers.dart';
import 'package:safarni/features/hotel_booking/presentation/view/hotel_booking_view.dart';
import 'package:safarni/features/rooms/details/domain/entity/gallery_entity.dart';
import 'package:safarni/features/rooms/details/domain/entity/review_entity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ReviewEntityAdapter());
  await Hive.openBox<ReviewEntity>('review');
  Hive.registerAdapter(GalleryEntityAdapter());
  await Hive.openBox<GalleryEntity>('gallery');
  getItSetup();
  runApp(const SafarniApp());

  // runApp(DevicePreview(builder: (context) => const SafarniApp()));
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
      builder: (_, _) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HotelBookingView(),
          color: AppColors.white,
          onGenerateRoute: AppRouters.onGenerateRoute,
        );
      },
    );
  }
}
