import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/core/constant/app_style.dart';

class WelocomeTextWidget extends StatelessWidget {
  const WelocomeTextWidget({super.key, this.title, this.style});
  final String? title;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text(
        title ?? AppStrings.welcome,
        style: style ?? AppStyle.poppins32px600WGray900,
      ),
    );
  }
}
