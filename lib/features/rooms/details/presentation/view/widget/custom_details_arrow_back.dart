import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_icons.dart';

class CustomDetailsArrowBack extends StatelessWidget {
  const CustomDetailsArrowBack({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 48,
        height: 48,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            AppIcons.iconsArrowBack,
            fit: BoxFit.fill,
            height: 22,
            width: 22,
          ),
        ),
      ),
    );
  }
}
