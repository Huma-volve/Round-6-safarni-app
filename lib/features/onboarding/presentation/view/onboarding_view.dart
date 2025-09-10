import 'package:flutter/material.dart';
import 'package:safarni/core/constant/routes_names.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/onboarding/presentation/view/widgets/custom_nav_bar_widget.dart';
import 'package:safarni/features/onboarding/presentation/view/widgets/onboarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: CustomNavWidget(
                onTap: () => Navigator.pushReplacementNamed(
                  context,
                  RoutesNames.getStarted,
                ),
              ),
            ),
            SliverToBoxAdapter(child: VerticalSpace(height: 15)),
            SliverToBoxAdapter(child: OnboardingBody()),
          ],
        ),
      ),
    );
  }
}
