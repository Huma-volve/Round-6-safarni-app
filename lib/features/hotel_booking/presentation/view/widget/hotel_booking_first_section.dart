import 'package:flutter/material.dart';
import 'package:safarni/core/widgets/search_text_field.dart';

class HotelBookingFirstSection extends StatelessWidget {
  const HotelBookingFirstSection({required this.onChanged, super.key});
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSearchTextfield(onChanged: onChanged),
        const SizedBox(height: 24),
      ],
    );
  }
}
