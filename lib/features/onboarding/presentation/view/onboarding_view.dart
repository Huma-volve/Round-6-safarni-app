import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:safarni/core/utils/app_strings.dart';
import 'package:safarni/core/utils/app_styles.dart';
import 'package:safarni/core/utils/assets.dart';
import 'package:safarni/core/widgets/spacing/horizontal_space.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [SliverToBoxAdapter(child: CustomNav())],
          ),
        ),
      ),
    );
  }
}

class CustomNav extends StatelessWidget {
  const CustomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(AppStrings.safarni, style: AppStyles.poppins24px700WPrimayColor),

        Row(
          children: [
            Text(AppStrings.skip, style: AppStyles.poppins16px600WPrimayColor),
            // SvgPicture.asset(IconsManager.arrorwIcon),
          ],
        ),
      ],
    );
  }
}

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
