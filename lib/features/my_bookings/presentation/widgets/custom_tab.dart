import 'package:flutter/material.dart';

class CustomTabItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final double width;

  const CustomTabItem({
    required this.icon,
    required this.label,
    super.key,
    this.width = 106, // عرض افتراضي
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(icon), const SizedBox(width: 4), Text(label)],
      ),
    );
  }
}
