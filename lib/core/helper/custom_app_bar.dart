import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/utils/assets.dart';

AppBar customAppBar() {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    leading: Center(child: SvgPicture.asset(Assets.imagesArrowBack)),
  );
}
