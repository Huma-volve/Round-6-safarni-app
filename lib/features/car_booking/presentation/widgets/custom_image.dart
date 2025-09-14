import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_images.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 211,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      child: Image.asset(AppImages.image_car),
    );
  }
}
