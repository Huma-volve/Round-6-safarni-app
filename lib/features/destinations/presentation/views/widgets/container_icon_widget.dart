import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';

class ContainerIconWidget extends StatelessWidget {
  const ContainerIconWidget({super.key, this.margin, this.child});
  final EdgeInsetsGeometry? margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
      ),
      child: child,
    );
  }
}
