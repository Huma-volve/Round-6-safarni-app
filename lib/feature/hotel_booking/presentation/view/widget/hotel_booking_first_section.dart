import 'package:flutter/material.dart';
import 'package:safarni/core/widget/search_text_field.dart';

class HotelBookingFirstSection extends StatelessWidget {
  const HotelBookingFirstSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [CustomSearchTextfield(), SizedBox(height: 24)],
    );
  }
}
