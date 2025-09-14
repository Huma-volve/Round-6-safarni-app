import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({required this.width, super.key});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width.w);
  }
}
