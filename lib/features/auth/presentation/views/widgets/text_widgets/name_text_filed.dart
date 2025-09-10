import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_style.dart';

class NameTextFormFiled extends StatelessWidget {
  const NameTextFormFiled({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(name, style: AppStyle.poppins14px500WGray800);
  }
}
