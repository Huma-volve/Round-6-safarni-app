import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/core/constant/app_style.dart';

class DetailsAboutSafarni extends StatelessWidget {
  const DetailsAboutSafarni({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.safarniIsYourAllInOneTravelGuide,
      style: AppStyle.poppins14px600WGray600,
      textAlign: TextAlign.center,
    );
  }
}
