import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class BoardingPassView extends StatelessWidget {
  const BoardingPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new, color: AppColors.grey900),
        backgroundColor: AppColors.white,
        title: Text(
          'Boarding Pass',
          style: AppStyles.font14Meduim.copyWith(
            fontSize: 18,
            color: AppColors.grey900,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
