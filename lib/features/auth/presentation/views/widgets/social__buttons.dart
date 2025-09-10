import 'package:flutter/material.dart';
import 'package:safarni/core/constant/app_strings.dart';
import 'package:safarni/core/constant/assets.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/auth/presentation/views/widgets/custom_button_with_icon.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButtonWithIcon(
          onPressed: () {},
          icon: Assets.assetsImagesIconsGoogleIcon,
          title: AppStrings.signInWithGoogle,
        ),
        const VerticalSpace(height: 12),
        CustomButtonWithIcon(
          onPressed: () {},
          icon: Assets.assetsImagesIconsFacebookIcon,
          title: AppStrings.signInWithFacebook,
        ),
        const VerticalSpace(height: 12),
        CustomButtonWithIcon(
          onPressed: () {},
          icon: Assets.assetsImagesIconsAppleIcon,
          title: AppStrings.signInWithApple,
        ),
      ],
    );
  }
}
