import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';

class DetailsAboutSafarni extends StatelessWidget {
  const DetailsAboutSafarni({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.safarniIsYourAllInOneTravelGuide,
      style: AppStyles.poppins14px600WGray600,
      textAlign: TextAlign.center,
    );
  }
}
