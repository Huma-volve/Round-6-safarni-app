import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_count.dart';

class CustomCalCount extends StatefulWidget {
  const CustomCalCount({required this.onChanged, super.key});
  final ValueChanged<int> onChanged;
  @override
  State<CustomCalCount> createState() => _CustomCalCountState();
}

class _CustomCalCountState extends State<CustomCalCount> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              if (count == 0) return;
              count -= 1;
              widget.onChanged(count);
            });
          },
          child: Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              '-',
              style: TextStyle(
                color: Color(0xFF282828),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(width: 12),

        CustomCount(count: count),
        const SizedBox(width: 12),

        GestureDetector(
          onTap: () {
            setState(() {
              count += 1;
              widget.onChanged(count);
            });
          },
          child: Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.thirdColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: const Text(
              '+',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
