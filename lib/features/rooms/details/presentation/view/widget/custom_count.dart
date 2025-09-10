import 'package:flutter/material.dart';

class CustomCount extends StatelessWidget {
  const CustomCount({required this.count, super.key});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Text(
      count.toString(),
      style: const TextStyle(
        color: Color(0xFF282828),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
