import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_styles.dart';
import 'package:safarni/core/widgets/custom_text_field.dart';

class LabelAndTextBoxWidget extends StatelessWidget {
  const LabelAndTextBoxWidget({
    required this.hint,
    required this.label,
    super.key,
    this.padding,
    this.labelPadding,
    this.suffixIcon,
    this.readOnly,
    this.controller,
    this.onTap,
  });
  final String hint;
  final TextEditingController? controller;
  final String label;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? labelPadding;
  final Widget? suffixIcon;
  final bool? readOnly;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: labelPadding ?? const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            label,
            style: AppStyles.font14Meduim.copyWith(
              color: AppColors.grey800Color,
            ),
          ),
        ),
        Padding(
          padding:
              padding ??
              const EdgeInsets.only(top: 6.0, right: 16, left: 16, bottom: 16),
          child: CustomTextFormFeild(
            onTap: onTap,
            controller: controller,
            readOnly: readOnly,
            suffixIcon: suffixIcon,
            hintStyle: AppStyles.font15Regular.copyWith(
              color: AppColors.greyHintColor,
              fontSize: 13,
            ),
            hint: hint,
            enabledBorderColor: AppColors.bordergreyColor,
            focusedBorderColor: AppColors.bordergreyColor,
            border: 4,
          ),
        ),
      ],
    );
  }
}
