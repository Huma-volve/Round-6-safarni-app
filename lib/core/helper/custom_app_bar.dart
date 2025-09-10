import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safarni/core/constants/app_icons.dart';

AppBar customAppBar({required BuildContext context}) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    leading: Center(child: SvgPicture.asset(AppIcons.iconsArrowBack)),
  );
}
