import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_routes.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/constants/cache_keys.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/core/service_locator/service_locator.dart';
import 'package:safarni/core/utils/cache_helper.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    checkVisited();

    super.initState();
  }

  Future<bool> isVisitedFun() async {
    bool? isVisited =
        await sl<CacheHelper>().containKey(CacheKeys.isVisited) ?? false;
    return isVisited;
  }

  Future<bool> isAuthorizedFun() async {
    bool? isAuthorized =
        await sl<CacheHelper>().containKey(CacheKeys.authorized) ?? false;
    return isAuthorized;
  }

  void delayedNavigation(context, String path) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
    });
  }

  Future<void> checkVisited() async {
    bool isVisited = await isVisitedFun();
    bool isAuthorized = await isAuthorizedFun();
    if (isVisited) {
      if (isAuthorized) {
        delayedNavigation(context, AppRoutes.customButtomNavBar);
        // delayedNavigation(context, RoutesNames.getStarted);
      } else {
        delayedNavigation(context, RoutesNames.getStarted);
      }
    } else {
      delayedNavigation(context, RoutesNames.onboarding);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.backgroundSplash)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 145.w,
              height: 136.5533905029297.h,
              child: Image.asset(AppImages.assetsImagesLogoImage),
            ),
            Align(
              child: Text(
                AppStrings.safarni,
                style: AppStyles.poppins24px700WPrimayColor.copyWith(
                  fontSize: 32.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
