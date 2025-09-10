import 'package:flutter/material.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_continue_button.dart';
import 'package:safarni/features/rooms/details/presentation/view/widget/custom_hotel_book.dart';

Future<dynamic> bookHotelBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    context: context,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: const Column(
            children: [CustomHotelBook(), CustomContinueButton()],
          ),
        ),
      );
    },
  );
}