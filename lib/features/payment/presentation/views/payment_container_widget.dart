import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class PaymentMethodContainerWidget extends StatelessWidget {
  const PaymentMethodContainerWidget({
    required this.icon,
    required this.text,
    super.key,
  });
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.grey100Color.withOpacity(0.4),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        spacing: 8,
        children: [
          SvgPicture.asset(icon),
          Text(text, style: AppStyles.font14Meduim),
        ],
      ),
    );
  }
}
