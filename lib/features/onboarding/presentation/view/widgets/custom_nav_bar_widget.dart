import 'package:flutter/material.dart';
import 'package:safarni/core/constants/app_strings.dart';
import 'package:safarni/core/constants/app_styles.dart';

import 'package:safarni/features/onboarding/presentation/view/widgets/skip_button_widget.dart';

class CustomNavWidget extends StatelessWidget {
  const CustomNavWidget({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppStrings.safarni, style: AppStyles.poppins24px700WPrimayColor),

          SkipButtonWidget(onTap: onTap),
        ],
      ),
    );
  }
}
