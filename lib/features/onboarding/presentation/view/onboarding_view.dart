import 'package:flutter/material.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/onboarding/presentation/view/widgets/custom_nav_bar_widget.dart';
import 'package:safarni/features/onboarding/presentation/view/widgets/onboarding_body.dart';

import '../../../../core/constants/cache_keys.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../../core/utils/cache_helper.dart';

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
                onTap: (){
              sl<CacheHelper>().saveData(
              CacheKeys.isVisited,
              true.toString(),
              );
              Navigator.pushReplacementNamed(
              context,
              RoutesNames.getStarted,
              );
              }
              ),
            ),
            const SliverToBoxAdapter(child: VerticalSpace(height: 15)),
            const SliverToBoxAdapter(child: OnboardingBody()),
          ],
        ),
      ),
    );
  }
}
