import 'package:flutter/material.dart';
import 'package:safarni/core/constants/routes_names.dart';
import 'package:safarni/core/widgets/spacing/vertical_space.dart';
import 'package:safarni/features/onboarding/data/onboarding_data.dart';
import 'package:safarni/features/onboarding/presentation/view/widgets/build_bottom_button.dart';
import 'package:safarni/features/onboarding/presentation/view/widgets/build_page_view.dart';
import 'package:safarni/features/onboarding/presentation/view/widgets/indicator_page_widget.dart';
import 'package:safarni/features/onboarding/presentation/view/widgets/onboarding_text_widget.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  PageController controller = PageController(viewportFraction: 0.75);
  @override
  int numberPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildPageView(
          numberPage: numberPage,
          pageController: controller,
          onPageChanged: (numPage) {
            setState(() {
              numberPage = numPage;
            });
          },
        ),
        const VerticalSpace(height: 16),
        IndicatorPageWidget(controller: controller),
        const VerticalSpace(height: 24),
        OnbordingTextWidget(text: onboardingData[numberPage].title),
        const VerticalSpace(height: 59),
        buildBottomButton(
          context,
          numberPage: numberPage,
          onPressed: () {
            if (numberPage < onboardingData.length - 1) {
              controller.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.linear,
              );
            } else {
              Navigator.pushReplacementNamed(context, RoutesNames.getStarted);
            }
          },
        ),
      ],
    );
  }
}
