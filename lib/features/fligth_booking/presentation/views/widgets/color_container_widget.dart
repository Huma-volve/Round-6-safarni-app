import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_styles.dart';

class ColorContainerWidget extends StatelessWidget {
  const ColorContainerWidget({
    required this.color,
    required this.text,
    super.key,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        Text(text, style: AppStyles.font15Regular),
      ],
    );
  }
}
