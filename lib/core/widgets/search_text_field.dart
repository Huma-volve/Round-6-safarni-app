import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constants/app_colors.dart';
import 'package:safarni/core/constants/app_icons.dart';
import 'package:safarni/core/constants/app_styles.dart';

class CustomSearchTextfield extends StatelessWidget {
  const CustomSearchTextfield({super.key, this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: SizedBox(
          width: 20,
          child: Center(child: SvgPicture.asset(AppIcons.iconsSearchIcon)),
        ),
        hintStyle: AppStyles.textRegular15(
          context: context,
        ).copyWith(color: AppColors.secondColor),
        hintText: 'Search ... ',

        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        strokeAlign: BorderSide.strokeAlignOutside,
        color: AppColors.eighthColor,
      ),
    );
  }
}
