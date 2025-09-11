import 'package:flutter/material.dart';

class CustomProfileInfoTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final String initialValue;
  final TextInputType keyboardType;

  const CustomProfileInfoTextField({
    required this.label,
    required this.icon,
    required this.initialValue,
    super.key,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,

      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
