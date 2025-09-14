import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({required this.height, super.key});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height.h);
  }
}
