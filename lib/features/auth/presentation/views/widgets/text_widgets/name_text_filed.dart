import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_styles.dart';

class NameTextFormFiled extends StatelessWidget {
  const NameTextFormFiled({required this.name, super.key});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(name, style: AppStyles.poppins14px500WGray800);
  }
}
