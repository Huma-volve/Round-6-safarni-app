import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';

class WelocomeTextWidget extends StatelessWidget {
  const WelocomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(AppStrings.welcome, style: AppStyles.poppins32px600WGray900),
    );
  }
}
