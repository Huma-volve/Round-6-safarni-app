import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_size.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_button.dart';
import 'package:safarni/feature/rooms/details/presentation/view/widget/custom_total_price.dart';

class CustomBookNow extends StatelessWidget {
  const CustomBookNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 124,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0xFFD1D5DB),
            blurRadius: 39,
            offset: Offset(10, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSize.padding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTotalPrice(),
            const SizedBox(width: 36),
            CustomButton(title: 'Book now', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
