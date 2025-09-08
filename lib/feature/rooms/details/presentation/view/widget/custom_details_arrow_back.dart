import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constant/assets.dart';

class CustomDetailsArrowBack extends StatelessWidget {
  const CustomDetailsArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Center(child: SvgPicture.asset(Assets.iconsArrowBack)),
    );
  }
}
