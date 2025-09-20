import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/features/compare/presentation/views/screens/compare_screen.dart';
import 'package:safarni/features/favourite/presentation/view/favourite_screen.dart';
import 'package:safarni/features/maps/presentions/views/screens/google_map_view.dart';

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
    controller = PersistentTabController();
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: controller,
      tabs: [
        PersistentTabConfig(
          screen: HomeScreen(),
          item: ItemConfig(
            icon: const Icon(CupertinoIcons.home),
            title: 'Home',
            textStyle: AppStyles.bottomNavTitle,
            activeForegroundColor: AppColors.iconBottomNavColor,
          ),
        ),
        PersistentTabConfig(
          screen: const FavouriteScreen(),
          item: ItemConfig(
            icon: const Icon(CupertinoIcons.heart),
            title: 'Favourite',
            textStyle: AppStyles.bottomNavTitle,
            activeForegroundColor: AppColors.iconBottomNavColor,
          ),
        ),
        PersistentTabConfig(
          screen: CompareScreen(),
          item: ItemConfig(
            icon: Image(
              image: AssetImage(AppImages.iconCompare),
              fit: BoxFit.cover,
            ),
            title: 'Compare',
            textStyle: AppStyles.bottomNavTitle,
            activeForegroundColor: AppColors.iconBottomNavColor,
          ),
        ),
        PersistentTabConfig(
          screen: GoogleMapsView(),
          item: ItemConfig(
            icon: const Icon(CupertinoIcons.map),
            title: 'Maps',
            textStyle: AppStyles.bottomNavTitle,
            activeForegroundColor: AppColors.iconBottomNavColor,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) =>
          Style1BottomNavBar(navBarConfig: navBarConfig),
      stateManagement: false,
    );
  }
}
