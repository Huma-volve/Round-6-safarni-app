import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomReviewTextField extends StatelessWidget {
  const CustomReviewTextField({
    required this.maxLines,
    required this.hintText,
    super.key,
    this.onSaved,
    this.onChanged,
  });
  final Function(String)? onChanged;
  final int maxLines;
  final String hintText;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'field is required';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      maxLines: maxLines,

      decoration: InputDecoration(
        fillColor: AppColors.reviewFieldColor,
        filled: true,
        hintText: hintText,
        hintStyle: AppStyles.textRegular17.copyWith(
          color: AppColors.seventhColor,
        ),
        enabledBorder: outlineBorder(),
        focusedBorder: outlineBorder(),
      ),
    );
  }

  OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.reviewFieldColor),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
