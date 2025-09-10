import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_styles.dart';

class NameTextFormFiled extends StatelessWidget {
  const NameTextFormFiled({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(name, style: AppStyles.poppins14px500WGray800);
  }
}
