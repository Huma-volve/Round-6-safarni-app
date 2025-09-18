import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_styles.dart';

class SeatNumberContainerWidget extends StatelessWidget {
  const SeatNumberContainerWidget({
    required this.number,
    required this.color,
    this.textColor,
    super.key,
  });
  final int number;
  final Color color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 26,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Text(
          '$number',
          textAlign: TextAlign.center,
          style: AppStyles.font15Regular.copyWith(color: textColor),
        ),
      ),
    );
  }
}
