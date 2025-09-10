import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_size.dart';
import 'package:safarni/core/helper/book_hotel_bottom_sheet.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_button.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_total_price.dart';

class CustomBookNow extends StatelessWidget {
  const CustomBookNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .17,
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
            const Expanded(child: CustomTotalPrice()),
            const SizedBox(width: 36),
            CustomButton(
              title: 'Book now',
              onPressed: () {
                bookHotelBottomSheet(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
