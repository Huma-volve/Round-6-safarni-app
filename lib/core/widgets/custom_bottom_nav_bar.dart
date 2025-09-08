import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:safarni/core/constants/app_assets.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

import '../../features/home/presentation/view/home_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {

  PersistentTabController? controller;
  @override
  void initState() {
    super.initState();
    controller= PersistentTabController();
  }
  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      backgroundColor: AppColors.white,
      controller:controller ,
      tabs: [
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(icon: Icon(CupertinoIcons.home), title: "Home",textStyle: AppStyles.bottomNavTitle,activeForegroundColor: AppColors.iconBottomNavColor),
        ),
        PersistentTabConfig(
          screen: Scaffold(body: Center(child: Text("Favourite Screen"))),
          item: ItemConfig(
            icon: Icon(CupertinoIcons.heart),
            title: "Favourite",
              textStyle: AppStyles.bottomNavTitle,activeForegroundColor: AppColors.iconBottomNavColor
          ),
        ),
        PersistentTabConfig(
          screen: Scaffold(body: Center(child: Text("Compare Screen"),),),
          item: ItemConfig(icon: Image(image: AssetImage(AppAssets.iconCompare),fit: BoxFit.cover,), title: "Compare",textStyle: AppStyles.bottomNavTitle,activeForegroundColor: AppColors.iconBottomNavColor),
        ),
        PersistentTabConfig(
          screen: Scaffold(body: Center(child: Text("Maps Screen"))),
          item: ItemConfig(
            icon: Icon(CupertinoIcons.map),
            title: "Maps",
              textStyle: AppStyles.bottomNavTitle,activeForegroundColor: AppColors.iconBottomNavColor
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) =>
          Style1BottomNavBar(navBarConfig: navBarConfig),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      screenTransitionAnimation: const ScreenTransitionAnimation(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      stateManagement: true,

    );
  }
}
/*
Container(
                width: 50.w,
                height: 40.h,
                decoration:BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [AppColors.white,Colors.blue],begin: AlignmentDirectional.centerEnd,end: AlignmentDirectional.topCenter)
            ),child:
 */