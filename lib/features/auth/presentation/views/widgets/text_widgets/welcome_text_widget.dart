import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/core/constant/app_style.dart';

class WelocomeTextWidget extends StatelessWidget {
  const WelocomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(AppStrings.welcome, style: AppStyle.poppins32px600WGray900),
    );
  }
}
