import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_styles.dart';

class TripTypeContainerWidget extends StatelessWidget {
  const TripTypeContainerWidget({
    required this.text,
    required this.color,
    required this.icon,
    this.textColor,
    super.key,
    this.margin,
  });
  final EdgeInsetsGeometry? margin;
  final String text;
  final Color color;
  final String icon;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        spacing: 8,
        children: [
          SvgPicture.asset(icon),
          Text(text, style: AppStyles.font14Meduim.copyWith(color: textColor)),
        ],
      ),
    );
  }
}
