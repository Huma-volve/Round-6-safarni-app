import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/constant/app_colors.dart';
import 'package:safarni/core/constant/app_style.dart';
import 'package:safarni/core/constant/assets.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: SizedBox(
          width: 20,
          child: Center(child: SvgPicture.asset(Assets.iconsSearchIcon)),
        ),
        hintStyle: AppStyle.textRegular15.copyWith(
          color: AppColors.secondColor,
        ),
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
