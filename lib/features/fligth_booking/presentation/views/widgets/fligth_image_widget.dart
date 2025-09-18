import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_images.dart';
import 'package:safarni/core/constants/app_styles.dart';

class FlightImageWidget extends StatelessWidget {
  const FlightImageWidget({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.flightImage,
          width: double.infinity,
          fit: BoxFit.contain,
        ),
        Positioned(
          top: 65,
          left: 30,
          child: Row(
            spacing: 70,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: AppColors.white,
                ),
              ),
              Text(
                text,
                style: AppStyles.font14Meduim.copyWith(
                  fontSize: 18,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
